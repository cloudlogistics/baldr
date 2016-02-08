require 'baldr'
require 'active_support/all'
require 'pry'

Dir['./spec/support/**/*.rb'].each {|f| require f}

RSpec.configure do |config|
  config.order = "random"
end
