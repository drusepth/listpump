class CreateFamilialListRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :familial_list_relationships do |t|
      t.integer :parent_list_id, foreign_key: true
      t.integer :child_list_id, foreign_key: true

      t.timestamps
    end
  end
end
