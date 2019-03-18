class CreateFamilialListRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :familial_list_relationships do |t|
      t.references :parent_list, foreign_key: true
      t.references :child_list, foreign_key: true

      t.timestamps
    end
  end
end
