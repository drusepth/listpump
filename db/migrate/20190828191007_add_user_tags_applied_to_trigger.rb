class AddUserTagsAppliedToTrigger < ActiveRecord::Migration[5.0]
  def change
    add_column :triggers, :user_tags_applied, :string
  end
end
