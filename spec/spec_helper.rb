
require "rubygems"
$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

require 'rspec'
require 'worksnaps'

RSpec.configure do |config|
end

WorkSnaps.configure do |config|
  # set the api tocken
  config.api_tocken = ""
end

