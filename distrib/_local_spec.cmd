echo off
rem examples of usage
rem
rem rspec ./spec/lib/date_time_picker_spec.rb
rem rspec ./spec/lib/date_time_picker_spec.rb --format nested


Rem: set path 
SET PATH=
SET PATH=%PATH%;D:/Binutils/Ruby192/bin
SET PATH=%PATH%;C:/Binutils/Ruby192/bin
SET PATH=%PATH%;D:/Binutils/Ruby-186-27/bin
SET PATH=%PATH%;C:/Binutils/Ruby-186-27/bin
SET PATH=%PATH%;D:/Binutils/rubygems-1.3.5/bin
SET PATH=%PATH%;C:/Binutils/rubygems-1.3.5/bin

Rem: set enviroment and execute ant script
cd ./..
rspec ./spec
rem rspec ./spec/lib/date_time_picker_spec.rb
rem rspec ./spec/lib/date_time_picker/date_time_picker_spec.rb
cd ./distrib

