class CreatePersonTags < ActiveRecord::Migration[5.0]
  def change
    create_table :person_tags do |t|
      t.references :person, foreign_key: true
      t.string :tag

      t.timestamps
    end
  end
end
