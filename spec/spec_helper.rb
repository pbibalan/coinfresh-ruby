require 'coinfresh'
require 'debugger'

require 'support/common_let_helpers'
require 'support/json_api_helpers'

require 'rspec'
require 'rspec/core/shared_context'
require 'webmock/rspec'

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.filter_run_excluding :external => true
  config.include CommonLetHelpers  
end