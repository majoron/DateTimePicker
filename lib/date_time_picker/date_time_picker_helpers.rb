module DateTimePicker
  module ViewHelpers

    def self.helper(name, template, method, options) # :nodoc:
      value = options.delete :value
      id = options.delete :id
      classes = options.delete :class
      case classes
      when NilClass
        classes = method
      when Array
        classes << method
      else
        classes = [classes, method]
      end
      locale = options.delete :locale
      locale ||= I18n.locale
      template.text_field_tag name, value, :id => id, :class => classes, :data => {:locale => locale, :options => options.to_json}
    end

    def self.restore_args(args, method)
      case args.count
      when 1
        name = args[0]
        options = {}
      when 2
        name = args[0]
        options = args[1]
      else
        raise ArgumentError.new(args.count)
      end
      method = method.to_s.gsub '_', ''
      return name, options, method
    end

    module FormHelpers
      
      def self.included(base)
        ['date_time_picker', 'date_picker', 'time_picker'].each do |method|
          base.send :define_method, method do |*args|
            name, options, method = ViewHelpers.restore_args(args, __method__)
            options[:id] ||= "#{object_name}_#{name}"
            ViewHelpers.helper("#{object_name}[#{name}]", @template, method, options)
          end
        end
      end

    end

    module TagHelpers
      
      def self.included(base)
        ['date_time_picker', 'date_picker', 'time_picker'].each do |method|
          base.send :define_method, method do |*args|
            name, options, method = ViewHelpers.restore_args(args, __method__)
            ViewHelpers.helper(name, self, method, options)
          end
        end
      end

    end

    module AssetsHelper
      
      def date_time_picker_assets(locale = I18n.locale)
        javascript_include_tag(:date_time_picker) + stylesheet_link_tag(:date_time_picker)
      end

    end

  end
end

module ActionView # :nodoc:
  Helpers::FormBuilder.send :include, DateTimePicker::ViewHelpers::FormHelpers
  Base.send :include, DateTimePicker::ViewHelpers::TagHelpers
  Base.send :include, DateTimePicker::ViewHelpers::AssetsHelper
end
