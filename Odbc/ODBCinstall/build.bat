title ThinkSQL ODBC Driver Installer

"c:\program files\borland\delphi5\bin\brcc32" version.rc >build.log

if exist ThinkSQLODBCinstall.cfg (
	findstr /R /I /V "^-D" ThinkSQLODBCinstall.cfg >dcc32.cfg

	del ThinkSQLODBCinstall.cfg  
)

echo %date% %time% >>build.log

if /I "%1"=="TEST" (
	echo TEST >>build.log
	"c:\program files\borland\delphi5\bin\dcc32" -B -DDEBUG_LOG ThinkSQLODBCinstall.dpr >>build.log
) else (
	echo LIVE >>build.log
	"c:\program files\borland\delphi5\bin\dcc32" -B -$O+ -$R- -$Q- ThinkSQLODBCinstall.dpr >>build.log

       copy ThinkSQLODBCinstall.exe c:\ThinkSQLSource >>build.log
       copy ThinkSQLODBCinstall.dll c:\ThinkSQLSource >>build.log

	echo ThinkSQLODBCinstall: >>c:\ThinkSQLSource\success.log
	findstr /R "^[0-9] lines, " build.log >>c:\ThinkSQLSource\success.log
) 