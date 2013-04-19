@echo off

Rem: set path 
SET PATH=C:/Binutils/apache-ant-1.7.0/bin/;%PATH%
SET PATH=D:/Binutils/apache-ant-1.7.0/bin/;%PATH%

Rem: set java home
SET JAVA_HOME=C:/Progra~1/Java/jre7

echo on
Rem: set enviroment and execute ant script
ant

