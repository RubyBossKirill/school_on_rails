require 'spec_helper'

ENV['RAILS_ENV'] = 'test'
ENV['APP_HOST'] = 'http://localhost'

require_relative '../config/environment'
abort('The Rails environment is running in production mode!') if Rails.env.production?

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |file| require file }
require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  config.include(ActiveSupport::Testing::TimeHelpers)
  config.include(Helpers::Request, type: :request)
  config.include(Helpers::Responses, type: :request)

  config.fixture_path = Rails.root.join('spec/fixtures')

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
