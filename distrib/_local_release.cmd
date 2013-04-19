@echo off
rem examples of usage
rem


Rem: set path 
SET PATH=C:/Progra~1/Git/bin;%PATH%
SET PATH=C:/Binutils/msysgit/bin;%PATH%

Rem: set enviroment and release gem
cd ./..
gem release
cd ./distrib

