require 'rspec'
require 'webmock/rspec'
require_relative '../lib/issue_exporter'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
end
