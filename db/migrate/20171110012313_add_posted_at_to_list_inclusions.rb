class AddPostedAtToListInclusions < ActiveRecord::Migration[5.0]
  def change
    add_column :list_inclusions, :posted_at, :datetime
  end
end
