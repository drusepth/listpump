class List < ApplicationRecord
  has_many :list_inclusions, dependent: :destroy
  has_many :triggers, dependent: :destroy
  has_many :persons, through: :list_inclusions

  validates_presence_of :name
end
