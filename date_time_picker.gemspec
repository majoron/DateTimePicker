# encoding: UTF-8

Gem::Specification.new do |s|

  s.platform = Gem::Platform::RUBY
  s.name = %q{date_time_picker}
  s.version = "0.5.0"

  s.authors = ["Artem Rufanov"]
  s.date = %q{2011-12-25}
  s.summary = %q{A library allows to select date and time.}
  s.email = %q{developers@majoron.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = Dir.glob('lib/**/*') + %w(MIT-LICENSE README.rdoc)
  s.homepage = %q{http://www.majoron.com/project/rbundle/date_time_picker}
  s.require_paths = ["lib"]
  s.test_files = Dir.glob('spec/**/*')
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'

end