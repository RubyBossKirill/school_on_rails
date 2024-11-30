source 'https://rubygems.org'

ruby '3.3.1'
gem 'bcrypt'
gem 'bootsnap', require: false
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.4'
gem 'redis'

# auth
gem 'devise'
gem 'devise-jwt'
gem 'jsonapi-serializer'

# rack
gem 'rack-cors'

# custom gems
gem 'active_interaction'
gem 'blueprinter'
gem 'data_migrate'

# sidekiq
gem 'sidekiq'
gem 'sidekiq-limit_fetch'
gem 'sidekiq-scheduler'

group :rubocop do
  gem 'rubocop'
  gem 'rubocop-factory_bot'
  gem 'rubocop-rails'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'dox'
  gem 'webmock'
end

group :development do
end
