source "https://rubygems.org"

ruby "3.3.1"
gem "rails", "~> 7.1.4"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jbuilder"
gem "bcrypt"
gem "bootsnap", require: false
gem 'redis'

# auth
gem 'devise'
gem 'devise-jwt'

# custom gems
gem 'active_interaction'
gem 'data_migrate'

# sidekiq
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'sidekiq-limit_fetch'

group :rubocop do
  gem 'rubocop'
  gem 'rubocop-perfomance'
  gem 'rubocop-rails'
  gem 'rubocop-factory_bot'
end

group :development, :test do
  gem 'faker'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'pry'
end

group :test do
  gem 'webmock'
  gem 'dox'
  gem 'database_cleaner-active_record'
end

group :development do
end

