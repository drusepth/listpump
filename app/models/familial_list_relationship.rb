class FamilialListRelationship < ApplicationRecord
  belongs_to :parent_list, foreign_key: 'parent_list_id', class_name: List.name
  belongs_to :child_list,  foreign_key: 'child_list_id',  class_name: List.name
end
