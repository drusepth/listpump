class ListInclusion < ApplicationRecord
  belongs_to :list
  belongs_to :person
  belongs_to :trigger

  has_many :list_inclusion_sources

  default_scope { where(flagged_invalid_at: nil) }
end
