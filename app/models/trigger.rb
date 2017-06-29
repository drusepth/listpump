class Trigger < ApplicationRecord
  belongs_to :list

  validates_presence_of :list, :search_query
  before_save :validate_pattern_as_regexp

  def run
    RedditSearchService.search(self.search_query).map do |search_result|
      if matchdata = Regexp.new(self.pattern).match(search_result.title + search_result.selftext)
        matched_substring = matchdata[0]

        ListInclusion.find_or_create_by(
          list:         self.list,
          person:       Person.find_or_create_by(name: search_result.author.name, medium: 'reddit'),
          trigger:      self,
          matched_text: matched_substring
        )
      end
    end
  end

  def validate_pattern_as_regexp
    !!Regexp.new(self.pattern)
  rescue RegexpError
    throw :abort
  end
end
