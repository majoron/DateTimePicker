module DateTimePicker
  module ViewHelpers

    def self.helper(name, template, classes, options) # :nodoc:
      value = options.delete :value
      id = options.delete :id
      classes = [classes]
      klass = options.delete :class
      if klass.is_a? Array
        classes.concat klass
      else
        classes << klass
      end
      template.text_field_tag name, value, :id => id, :class => klass, :data => {:options => options.to_json}
    end

    module FormHelpers

      def date_time_picker(name, options={})
        options[:id] ||= "#{object_name}_#{name}"
        ViewHelpers.helper("#{object_name}[#{name}]", @template, :datetimepicker, options)
      end

    end

    module TagHelpers
      
      def date_time_picker(name, options={})
        ViewHelpers.helper(name, self, :datetimepicker, options)
      end

    end

    module AssetsHelper
      
      def date_time_picker_assets
        assets = javascript_include_tag(:date_time_picker) + stylesheet_link_tag(:date_time_picker)
        localization = "jquery-ui-timepicker-#{I18n.locale}.js"
        localization = "localization/#{localization}" if Rails.application.assets.find_asset(localization).nil?
        assets.concat(javascript_include_tag(localization)) if Rails.application.assets.find_asset(localization)
        localization = "jquery.ui.datepicker-#{I18n.locale}.js"
        localization = "ui/i18n/#{localization}" if Rails.application.assets.find_asset(localization).nil?
        assets.concat(javascript_include_tag(localization)) if Rails.application.assets.find_asset(localization)
        # TODO: LOAD FROM CONFIG
        assets
      end

    end

  end
end

module ActionView # :nodoc:
  Helpers::FormBuilder.send :include, DateTimePicker::ViewHelpers::FormHelpers
  Base.send :include, DateTimePicker::ViewHelpers::TagHelpers
  Base.send :include, DateTimePicker::ViewHelpers::AssetsHelper
end
