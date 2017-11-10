class AddTrappedTextToListInclusions < ActiveRecord::Migration[5.0]
  def change
    add_column :list_inclusions, :trapped_text, :string
  end
end
