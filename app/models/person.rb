class Person < ApplicationRecord
  has_many :list_inclusions, dependent: :destroy
  has_many :lists, through: :list_inclusions
  has_many :person_tags, dependent: :destroy
end
