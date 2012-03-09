require 'action_controller/railtie'
require 'active_resource/railtie'

module App
  class Application < Rails::Application
  end
end

ActionController::Base.prepend_view_path 'views'

ENV["RAILS_ENV"] = 'test'
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara'
Capybara.run_server = true

require '../lib/date_time_picker'

require 'ruby-debug' #FIXME
