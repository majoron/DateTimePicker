# encoding: UTF-8

Gem::Specification.new do |s|

  s.platform = Gem::Platform::RUBY
  s.name = %q{date_time_picker}
  s.version = "0.5.0"

  s.authors = ["Artem Rufanov"]
  s.date = %q{2011-12-25}
  s.summary = %q{A library allows to select date and time.}
  s.email = %q{developers@majoron.com}

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'

  s.add_dependency 'jquery-rails'
  s.add_dependency 'json'

  s.files      = Dir.glob(['lib/**/*', 'vendor/assets/javascripts', 'vendor/assets/stylesheets', 'vendor/assets/jquery-ui/ui/i18n/jquery.ui.datepicker-*.js', 'vendor/assets/timepicker/**/*.js', 'vendor/assets/timepicker/*.css']) + %w(MIT-LICENSE README.rdoc)
  s.test_files = `git ls-files`.split("\n")

  s.has_rdoc = true
  s.extra_rdoc_files << 'README.rdoc'

end
