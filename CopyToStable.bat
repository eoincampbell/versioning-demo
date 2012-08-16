@ECHO OFF
SET /P GACVersion=Enter the Assembly Version Number for this cut: 
IF '%GACVersion%'=='' (
	ECHO You must enter a version number.
	PAUSE
	GOTO:EOF
)

SET DestDir="%CD%\Stable\%GACVersion%"
IF NOT EXIST %DestDir% MKDIR %DestDir%
DEL /S /F /Q %DestDir%*.*

COPY %CD%\VersioningDemo.Core\bin\*.dll %DestDir%
COPY %CD%\VersioningDemo.Core\bin\*.pdb %DestDir%
COPY %CD%\VersioningDemo.Core\bin\*.xml %DestDir%
COPY %CD%\VersioningDemo.DependentLib\bin\*.dll %DestDir%
COPY %CD%\VersioningDemo.DependentLib\bin\*.pdb %DestDir%
COPY %CD%\VersioningDemo.DependentLib\bin\*.xml %DestDir%

ECHO Done!
PAUSE