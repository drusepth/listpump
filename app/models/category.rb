class Category < ApplicationRecord
  has_many :categorizations
  has_many :lists, through: :categorizations
end
