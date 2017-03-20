=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end

ENV["RAILS_ENV"] ||= "test"
require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"

Dir[Rails.root.join("spec/support/*.rb")].each { |f| require f }

# ActiveRecord::Migration.maintain_test_schema!

OmniAuth.config.test_mode = true
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_gems_from_backtrace(
    "actionpack", "actionview", "activerecord", "activesupport", "capybara", "omniauth", "rack", "railties", "request_store", "rollbar"
  )
  config.include OmniauthTestHelpers
  config.include ThirdPartyMocks
end
