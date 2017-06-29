class ListInclusion < ApplicationRecord
  belongs_to :list
  belongs_to :person
  belongs_to :trigger
end
