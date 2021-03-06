title ThinkSQL dbExpress unit

REM build .pas project from Delphi to update sqlthink.cfg file
REM Note: end program must use same version of Indy!
if exist sqlthink.cfg (
	findstr /R /I /V "^-D" sqlthink.cfg >dcc32.cfg

	del sqlthink.cfg  
)

echo %date% %time% >build.log

echo LIVE >>build.log
"c:\program files\borland\delphi6\bin\dcc32" -B -$O+ -$R- -$Q- sqlthink.pas >>build.log

if /I "%1"=="TEST" (
	REM no copy
) else (
	copy sqlthink.dcu c:\ThinkSQLSource >>build.log

	echo sqlthink: >>c:\ThinkSQLSource\success.log
	findstr /R "^[0-9] lines, " build.log >>c:\ThinkSQLSource\success.log
) 