class ProcessListTriggersWorker
  include Sidekiq::Worker

  def perform(list_id)
    list = List.find(list_id)
    owner = list.user

    if owner.credits < 0
      return
    end

    triggers = list.triggers
    triggers.each do |trigger|
      trigger.run if owner.credits > 0
    end

  end
end