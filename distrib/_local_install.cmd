echo off

Rem: set path 
SET PATH=
SET PATH=%PATH%;D:/Binutils/Ruby192/bin
SET PATH=%PATH%;C:/Binutils/Ruby192/bin
SET PATH=%PATH%;D:/Binutils/Ruby187/bin
SET PATH=%PATH%;C:/Binutils/Ruby187/bin
SET PATH=%PATH%;D:/Binutils/Ruby-186-27/bin
SET PATH=%PATH%;C:/Binutils/Ruby-186-27/bin
SET PATH=%PATH%;D:/Binutils/rubygems-1.3.5/bin
SET PATH=%PATH%;C:/Binutils/rubygems-1.3.5/bin

echo on
Rem: set enviroment and execute ant script
gem install ./output/date_time_picker-0.5.2.gem --local
rem gem uninstall date_time_picker
rem gem list --local

