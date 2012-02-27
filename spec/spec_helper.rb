$:.unshift File.dirname(__FILE__)
$:.unshift File.join(File.dirname(__FILE__), '../lib')

ENV["RAILS_ENV"] = "test"
require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'logger'
require 'rails'
require 'action_controller'
require 'date_time_picker'

module Rails
  module VERSION
    MAJOR = 3
  end
end unless defined? Rails

# DateTimePicker.root = './'
RAILS_ROOT = './' unless defined?(RAILS_ROOT)
RAILS_ENV = 'test' unless defined?(RAILS_ENV)

RSpec.configure do |config|
  config.mock_with :rspec
end

