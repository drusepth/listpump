class List < ApplicationRecord
  has_many :triggers
  has_many :list_inclusions
  has_many :persons, through: :list_inclusions
end
