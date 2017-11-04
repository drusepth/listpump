source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.4'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

# None of these gems need to be in the Gemfile, but MacOS apparently requires
# them for some ungodly reason so I'm including them (and their super-out-of-date
# required versions) here. Feel free to comment them out if you're on a reasonable
# OS, since they're not actually used anywhere.
# gem 'mocha', '0.14.0'
# gem 'redis-store-testing'
# gem 'connection_pool', '~> 1.2.0'
# gem 'appraisal'

# We now return to your regularly-scheduled gems.
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# Social network integrations
gem 'redd'

# Design
gem 'bootstrap', git: 'https://github.com/twbs/bootstrap-rubygem'
gem 'rails-assets-bootstrap-toggle', source: 'https://rails-assets.org'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'pry'
  gem 'bullet'
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
end
