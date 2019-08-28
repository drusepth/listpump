class CreateListInclusionSources < ActiveRecord::Migration[5.0]
  def change
    create_table :list_inclusion_sources do |t|
      t.references :list_inclusion, foreign_key: true
      t.string :title
      t.string :body
      t.references :person, foreign_key: true
      t.datetime :posted_at
      t.string :source_url

      t.timestamps
    end
  end
end
