# :main: README.rdoc

module DateTimePicker # :nodoc:
  DIR = File.expand_path(File.dirname(__FILE__)) # :nodoc:
  class Engine < ::Rails::Engine # :nodoc:
  end

  module ClassMethods
    def activate *names
      names = names.flatten
      names.each {|name| activate_one name }
    end

    def activate_one name
      valid_framework? name
      load_extension name
    end

    def load_extension name
      require "#{name}/inputs_ext"
    rescue Exception => e
      raise NotImplementedError, "Unsupported Formbuilder or framework: #{name} - #{e}"
    end

    def valid_framework? name  
      case name.to_sym
      when :simple_form
        raise ArgumentError, "SimpleForm not defined" unless defined?(SimpleForm)
      when :formtastic
        raise ArgumentError, "Formtastic not defined" unless defined?(Formtastic)
      end
    end
  end
  extend ClassMethods
end

require File.join(DateTimePicker::DIR, 'date_time_picker', 'date_time_picker_helpers')
