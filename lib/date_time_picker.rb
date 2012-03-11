# :main: README.rdoc

module DateTimePicker # :nodoc:
  DIR = File.expand_path(File.dirname(__FILE__)) # :nodoc:
  class Engine < ::Rails::Engine # :nodoc:
  end
  class Tasks < Rails::Railtie
    rake_tasks do
      Dir[File.join(DateTimePicker::DIR, 'tasks', '*.rake')].each { |f| load f }
    end
  end
end

require File.join(DateTimePicker::DIR, 'date_time_picker', 'date_time_picker_helpers')
