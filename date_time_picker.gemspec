# encoding: UTF-8
require File.expand_path('../lib/date_time_picker/version', __FILE__)

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = %q{date_time_picker}
  s.version = DateTimePicker::VERSION
  s.authors = ["Artem Rufanov"]
  s.summary = %q{A library allows to select date and time.}
  s.email = %q{developers@majoron.com}
  s.homepage = "https://github.com/majoron/DateTimePicker"

  s.files = Dir.glob(['vendor/assets/javascripts/*.js', 'vendor/assets/stylesheets/*.css', 'vendor/assets/timepicker/*.js', 'vendor/assets/timepicker/*.css']) + %w(MIT-LICENSE README.rdoc)
  begin
    Dir.mkdir 'vendor/assets/i18n'
  rescue Errno::EEXIST
  end
  dir = Dir.new 'vendor/assets/i18n'
  i18n = Dir['vendor/assets/timepicker/localization/*.js'].map do |d|
    if (r = /jquery-ui-timepicker-([\w-]+)\.js/.match d)
      locale = r[1]
      l = File.read("vendor/assets/jquery-ui/ui/i18n/jquery.ui.datepicker-#{locale}.js")
      b = if locale == "pt-BR"
            File.read("vendor/assets/timepicker/localization/jquery-ui-timepicker-#{locale}.js").force_encoding("ISO-8859-1").encode("UTF-8", replace: '')
          else
            File.read("vendor/assets/timepicker/localization/jquery-ui-timepicker-#{locale}.js")
          end
      l.concat b
      l = l.split "\n"
      l = l.map do |line|
        case line
        when /setDefaults/
          ''
        when '(function($) {'
          'jQuery(function($) {'
        when '})(jQuery);'
          '});'
        else
          line
        end
      end
      l.join "\n"
      f = File.open("#{dir.path}/date_time_picker_#{locale}.js", 'w')
      f.puts l
      f.close
      f.path
    end  
  end  
  s.files.concat i18n
  s.files.concat (Dir.glob('lib/**/*') - Dir.glob('lib/api/**/*'))
  s.test_files = Dir.glob('test/**/*')
  s.has_rdoc = true
  s.extra_rdoc_files << 'README.rdoc'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'

  s.add_dependency 'jquery-rails'
  s.add_dependency 'json'
end
