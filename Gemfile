source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2'
gem 'puma', '~> 3.0'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'redd'

gem 'bootstrap', git: 'https://github.com/twbs/bootstrap-rubygem'
gem 'rails-assets-bootstrap-toggle', source: 'https://rails-assets.org'
gem 'material_icons'

gem 'sqlite3', '~> 1.3.6'

group :production do
  gem 'pg'
end

group :development, :test do
  # gem 'sqlite3'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'pry'
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
end
