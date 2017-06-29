class RateLimitingService < Service
  def self.full_distribution(list_to_filter)
    list_to_filter
  end

  def self.uniform_daily_distribution(list_to_filter)
    # For testing, run everything every time
    return full_distribution(list_to_filter)
    # todo remove ^

    hour_filter = DateTime.current.hour
    list_to_filter.select.with_index { |_, index| index % hour_filter == 0 }
  end
end