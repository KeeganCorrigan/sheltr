require 'simplecov'

SimpleCov.start 'rails' do
 add_filter "app/channels/application_cable/channel.rb"
 add_filter "app/channels/application_cable/connection.rb"
 add_filter "app/jobs/application_job.rb"
 add_filter "app/mailers/application_mailer.rb"
 add_filter "app/models/application_record.rb"
end

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
  config.filter_sensitive_data('<key>') { ENV["GOOGLE_API_KEY"] }
end

def stub_omniauth
  OmniAuth.config.test_mode = true

  omniauth_hash = {
                    provider: "google",
                    uid: "12345678910",
                    info: {
                      email: "keegan.rw.corrigan@gmail.com",
                      first_name: "keegan",
                      last_name: "corrigan"
                    },
                    credentials: {
                      token: "thisisfake",
                    }
                  }

  OmniAuth.config.add_mock(:google_oauth2, omniauth_hash)
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|

  config.before(:each) do
    stub_const("Twilio::REST::Client", FakeSMS)
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
