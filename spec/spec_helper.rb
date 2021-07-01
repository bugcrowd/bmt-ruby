require 'bundler/setup'
require 'bmt'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    # The following adds a new, test-only BMT versions
    stub_const('BMT::DATA_DIR', Pathname.new('spec/sample'))
  end
end
