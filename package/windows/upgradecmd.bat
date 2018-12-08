@echo off

set CMD_LINE_ARGS=
:setArgs
	if ""%1""=="""" goto doneSetArgs
	set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
	shift
	goto setArgs
:doneSetArgs

bin\jre\bin\java -cp bin/lib/jeedsoft-quicksilver-toolset.jar com.jeedsoft.quicksilver.toolset.pack.upgrade.UpgradeCmd %CMD_LINE_ARGS%
pause
