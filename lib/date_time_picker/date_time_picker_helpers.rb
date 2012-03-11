module DateTimePicker
  module ViewHelpers

    def self.helper(name, template, type, options) # :nodoc:
      value = options.delete :value
      id = options.delete :id
      classes = options.delete :class
      case classes
      when NilClass
        classes = type
      when Array
        classes << type
      else
        classes = [classes, type]
      end
      template.text_field_tag name, value, :id => id, :class => classes, :data => {:options => options.to_json}
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
      
      def date_time_picker_assets(locale = I18n.locale)
        assets = javascript_include_tag(:date_time_picker) + stylesheet_link_tag(:date_time_picker)
        localization = "jquery.ui.timepicker-#{locale}.js"
        localization = "localization/jquery-ui-timepicker-#{locale}.js" if Rails.application.assets.find_asset(localization).nil?
        assets.concat(javascript_include_tag(localization)) if Rails.application.assets.find_asset(localization)
        localization = "jquery.ui.datepicker-#{locale}.js"
        localization = "ui/i18n/#{localization}" if Rails.application.assets.find_asset(localization).nil?
        assets.concat(javascript_include_tag(localization)) if Rails.application.assets.find_asset(localization)
        config = YAML::load_file(Rails.application.root.join('config', 'date_time_picker.yml')).to_json
        assets.concat javascript_tag("$(function(){$.datepicker.setDefaults($.parseJSON('#{config}'));});")
        assets.concat javascript_tag("$(function(){$.timepicker.setDefaults($.parseJSON('#{config}'));});")
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
