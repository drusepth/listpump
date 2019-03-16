class AddParentListToLists < ActiveRecord::Migration[5.0]
  def change
    add_reference :lists, :parent_list, foreign_key: true
  end
end
