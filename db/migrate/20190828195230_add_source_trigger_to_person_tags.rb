class AddSourceTriggerToPersonTags < ActiveRecord::Migration[5.0]
  def change
    add_reference :person_tags, :trigger, foreign_key: true
  end
end
