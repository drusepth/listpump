class AddSourceUrlToListInclusion < ActiveRecord::Migration[5.0]
  def change
    add_column :list_inclusions, :source_url, :string
  end
end
