class ListInclusion < ApplicationRecord
  belongs_to :list
  belongs_to :person
  belongs_to :trigger

  default_scope { where(flagged_invalid_at: nil) }
end
