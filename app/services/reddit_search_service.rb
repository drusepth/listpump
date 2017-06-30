class RedditSearchService < Service
  def self.client
    @client ||= begin
      client = Redd.it(
        user_agent: 'reddit-watchlist-client',
        client_id:   ENV['REDDIT_CLIENT_ID'],
        secret:      ENV['REDDIT_SECRET']
      )
      client
    end

  rescue Redd::AuthenticationError => e
    self.fail_with("Couldn't authenticate to reddit, TODO alert someone", e)
  rescue HTTP::TimeoutError
    self.retry
  end

  def self.search(query_string)
    client.search "\"#{query_string}\"", { sort: :new }

  rescue HTTP::TimeoutError
    self.retry
  end
end
