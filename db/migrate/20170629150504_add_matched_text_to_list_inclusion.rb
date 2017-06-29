class AddMatchedTextToListInclusion < ActiveRecord::Migration[5.0]
  def change
    add_column :list_inclusions, :matched_text, :string
    add_reference :list_inclusions, :trigger, foreign_key: true
  end
end
