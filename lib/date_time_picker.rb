# :main: README.rdoc

module DateTimePicker # :nodoc:
  DIR = File.expand_path(File.dirname(__FILE__)) # :nodoc:
  class Engine < ::Rails::Engine # :nodoc:
  end
end

require File.join(DateTimePicker::DIR, 'date_time_picker', 'date_time_picker_helpers')
