class List < ApplicationRecord
  has_many :triggers, dependent: :destroy
  has_many :list_inclusions, dependent: :destroy
  has_many :persons, through: :list_inclusions
end
