class List < ApplicationRecord
  belongs_to :user

  validates_presence_of :name

  has_many :list_inclusions, dependent: :destroy
  has_many :triggers, dependent: :destroy
  has_many :persons, through: :list_inclusions

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  has_many :familial_list_relationships,
    foreign_key: 'parent_list_id',
    class_name: FamilialListRelationship.name
  has_many :parent_lists, through: :familial_list_relationships
  has_many :child_lists,  through: :familial_list_relationships
  def      sibling_lists; parent_lists.flat_map(&:child_lists); end

end
