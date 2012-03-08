module DateTimePicker
  module ViewHelpers

    def self.helper(name, template, options) # :nodoc:
      value = options.delete :value
      id = options.delete :id
      template.text_field_tag name, value, :id => id, :data => options
    end

    module FormHelper

      def date_time_picker(name, options={})
	ViewHelpers.helper("#{object_name}[#{name}]", @template, options)
      end

    end

    module TagHelper
      
      def date_time_picker(name, options={})
        ViewHelpers.helper(name, self, options)
      end

    end

  end
end

module ActionView # :nodoc:
  Helpers::FormBuilder.send :include, DateTimePicker::ViewHelpers::FormHelper
  Base.send :include, DateTimePicker::ViewHelpers::TagHelper
end
