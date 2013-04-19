module DateTimePicker
  module Generators
    class DateTimePickerGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_date_time_picker
        copy_file "date_time_picker.rb", "config/initializers/date_time_picker.rb"
      end
    end
  end
end
