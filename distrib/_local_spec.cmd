@echo off
rem examples of usage
rem
rem rspec ./spec/lib/date_time_picker_spec.rb
rem rspec ./spec/lib/date_time_picker_spec.rb --format nested


Rem: set enviroment and execute ant script
cd ./..
rspec ./spec
rem rspec ./spec/lib/date_time_picker_spec.rb
rem rspec ./spec/lib/date_time_picker/date_time_picker_spec.rb
cd ./distrib

