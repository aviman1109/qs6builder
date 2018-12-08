@echo off
cd ..\..
set JRE_HOME=%cd%\jre
cd apache-tomcat\bin
service install ${Ets.Install.ServiceName}
