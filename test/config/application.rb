require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'sprockets/railtie'

require 'jquery-rails'
require '../lib/date_time_picker.rb'

module App
  class Application < Rails::Application
  end
end
