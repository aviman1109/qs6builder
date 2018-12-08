@echo off

set CMD_LINE_ARGS=
:setArgs
	if ""%1""=="""" goto doneSetArgs
	set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
	shift
	goto setArgs
:doneSetArgs

..\jre\bin\java -cp lib/jeedsoft-quicksilver-toolset.jar com.jeedsoft.quicksilver.toolset.tool.dsconfig.EncPwdCmd %CMD_LINE_ARGS%
pause
