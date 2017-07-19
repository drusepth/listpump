namespace :reddit do
  task run: :environment do
    # Only run a subset of triggers each time this is run to evenly distribute load throughout the day
    triggers_to_run = RateLimitingService.uniform_daily_distribution(Trigger.where(enabled: true))
    triggers_to_run.each(&:run)
  end
end
