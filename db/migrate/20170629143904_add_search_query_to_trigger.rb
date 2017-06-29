class AddSearchQueryToTrigger < ActiveRecord::Migration[5.0]
  def change
    add_column :triggers, :search_query, :string
  end
end
