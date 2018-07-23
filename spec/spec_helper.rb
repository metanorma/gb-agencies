require 'simplecov'
SimpleCov.start
require "bundler/setup"
require "gb_agencies"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

LABELS = { "PRC" => "PRC",
           "industry_standard" => "Industry Standard",
           "local_standard" => "Local Standard",
           "enterprise_standard" => "Enterprise Standard",
           "social_standard" => "Social Standard" }
