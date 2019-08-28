class Trigger < ApplicationRecord
  belongs_to :list

  has_many :list_inclusions, dependent: :destroy
  has_many :people, through: :list_inclusions

  attr_accessor :user_tags_applied_string
  serialize :user_tags_applied, Array

  validates_presence_of :list, :search_query
  before_save :validate_pattern_as_regexp

  def run
    puts "Executing trigger #{self.id}"
    RedditSearchService.search(self.search_query).map do |search_result|
      if matchdata = Regexp.new(self.pattern, Regexp::IGNORECASE).match(search_result.title + "\n" + search_result.selftext)
        person = Person.find_or_create_by(name: search_result.author.name, medium: 'reddit')

        ListInclusion.unscoped.find_or_create_by(
          list:         self.list,
          person:       person,
          trigger:      self,
          matched_text: matchdata[0],
          trapped_text: matchdata.to_a.tap(&:shift).to_json,
          source_url:   "https://www.reddit.com#{search_result.permalink}",
          posted_at:    Time.at(search_result.created)
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
