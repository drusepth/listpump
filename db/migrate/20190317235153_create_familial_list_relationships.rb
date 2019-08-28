class CreateFamilialListRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :familial_list_relationships do |t|
      t.int :parent_list_id, foreign_key: true
      t.int :child_list_id, foreign_key: true

      t.timestamps
    end
  end
end
