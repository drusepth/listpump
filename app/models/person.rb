class Person < ApplicationRecord
  has_many :list_inclusions
  has_many :lists, through: :list_inclusions
end
