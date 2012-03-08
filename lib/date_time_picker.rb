# :main: README.rdoc

module DateTimePicker # :nodoc:
  class Engine < ::Rails::Engine # :nodoc:
  end
end

dir = File.expand_path(File.dirname(__FILE__))
require File.join(dir, 'date_time_picker', 'date_time_picker_helpers')