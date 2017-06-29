class CreateTriggers < ActiveRecord::Migration[5.0]
  def change
    create_table :triggers do |t|
      t.string :name
      t.string :pattern
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
