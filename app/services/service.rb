class Service
  def self.fail_with(message, error)
    puts message
    raise error
  end

  def self.retry
    puts "HTTP::TimeoutError -- TODO retry"
  end
end