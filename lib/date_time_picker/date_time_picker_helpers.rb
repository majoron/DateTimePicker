module DateTimePicker
  module ViewHelpers

    def self.helper(name, template, function, options) # :nodoc:
      value = options.delete :value
      id = options.delete :id
      klass = options.delete :klass
      klass = "hasDatepicker #{klass}" #FIXME
      template.text_field_tag name, value, :id => id, :class => klass, :data => {:function => function, :options => options.to_json}
    end

    module FormHelpers

      def date_time_picker(name, options={})
	ViewHelpers.helper("#{object_name}[#{name}]", @template, :datetimepicker, options)
      end

    end

    module TagHelpers
      
      def date_time_picker(name, options={})
        ViewHelpers.helper(name, self, :datetimepicker, options)
      end

    end

    module HeadHelper
      
      def include_date_time_picker
	defaults = "$.datepicker.setDefaults($.datepicker.regional['#{I18n.locale}']);"
	# TODO: LOAD FROM CONFIG
	javascript_include_tag(:date_time_picker) + javascript_tag(defaults)
      end

    end

  end
end

module ActionView # :nodoc:
  Helpers::FormBuilder.send :include, DateTimePicker::ViewHelpers::FormHelpers
  Base.send :include, DateTimePicker::ViewHelpers::TagHelpers
  Base.send :include, DateTimePicker::ViewHelpers::HeadHelper
end
