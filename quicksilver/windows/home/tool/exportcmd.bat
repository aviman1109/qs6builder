@echo off

set CMD_LINE_ARGS=
:setArgs
	if ""%1""=="""" goto doneSetArgs
	set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
	shift
	goto setArgs
:doneSetArgs

..\jre\bin\java -cp "lib/*" com.jeedsoft.quicksilver.toolset.tool.migrate.ExportCmd %CMD_LINE_ARGS%
pause
