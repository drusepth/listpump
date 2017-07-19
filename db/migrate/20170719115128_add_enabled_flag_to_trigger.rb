class AddEnabledFlagToTrigger < ActiveRecord::Migration[5.0]
  def change
    add_column :triggers, :enabled, :boolean, default: true
  end
end
