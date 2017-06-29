class CreateListInclusions < ActiveRecord::Migration[5.0]
  def change
    create_table :list_inclusions do |t|
      t.references :list, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
