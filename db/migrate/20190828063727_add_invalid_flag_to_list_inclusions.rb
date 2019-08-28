class AddInvalidFlagToListInclusions < ActiveRecord::Migration[5.0]
  def change
    add_column :list_inclusions, :flagged_invalid_at, :datetime
  end
end
