class AddConfidenceToTrigger < ActiveRecord::Migration[5.0]
  def change
    add_column :triggers, :confidence, :double
  end
end
