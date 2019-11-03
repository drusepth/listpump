class Trigger < ApplicationRecord
  belongs_to :list

  has_many :list_inclusions, dependent: :destroy
  has_many :people, through: :list_inclusions

  attr_accessor :user_tags_applied_string
  serialize :user_tags_applied, Array

  validates_presence_of :list, :search_query
  before_save :validate_pattern_as_regexp

  after_save do
    ProcessListTriggersWorker.perform_async(list.id) if list.user.credits > 0
  end

  def run
    puts "Executing trigger #{self.id}"
    owner = list.user

    RedditSearchService.search(self.search_query).map do |search_result|
      if matchdata = Regexp.new(self.pattern, Regexp::IGNORECASE).match(search_result.title + "\n" + search_result.selftext)
        person = Person.find_or_create_by(name: search_result.author.name, medium: 'reddit')

        inclusion = ListInclusion.unscoped.find_or_create_by(
          list:         self.list,
          person:       person,
          trigger:      self,
          matched_text: matchdata[0],
          trapped_text: matchdata.to_a.tap(&:shift).to_json,
          source_url:   "https://www.reddit.com#{search_result.permalink}",
          posted_at:    Time.at(search_result.created)
        )

        inclusion.list_inclusion_sources.find_or_create_by(
          title:      search_result.title,
          body:       search_result.selftext,
          person:     person,
          posted_at:  Time.at(search_result.created),
          source_url: "https://www.reddit.com#{search_result.permalink}"
        )

        self.user_tags_applied.each do |tag_text|
          person.person_tags.find_or_create_by(tag: tag_text, trigger: self)
        end

        owner.credits -= 1
      end
    end

    owner.save
  end

  def validate_pattern_as_regexp
    !!Regexp.new(self.pattern)
  rescue RegexpError
    throw :abort
  end
end
