# encoding: UTF-8

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = %q{date_time_picker}
  s.version = "0.5.4"
  s.authors = ["Artem Rufanov"]
  s.date = %q{2011-12-25}
  s.summary = %q{A library allows to select date and time.}
  s.email = %q{developers@majoron.com}
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'json'
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
      l.concat File.read("vendor/assets/timepicker/localization/jquery-ui-timepicker-#{locale}.js")
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
end
