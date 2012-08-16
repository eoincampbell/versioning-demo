@echo off
echo Updating GAC. Please wait...
echo GAC Update on %date% at %time% > GACLog.txt
echo.-^> Stopping IIS ^for GAC registration...
iisreset /STOP > nul
dir /B /S Stable\*.dll > AssemblyList.txt
echo -------------------------------------------------- AssemblyList.txt -------------------------------------------------- >> GACLog.txt
"C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Bin\NETFX 4.0 Tools\gacutil.exe" /il AssemblyList.txt /f >> GACLog.txt
echo -------------------------------------------------- AssemblyList.txt -------------------------------------------------- >> GACLog.txt
echo.-^> Deleting contents of download cache...
"C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Bin\NETFX 4.0 Tools\gacutil.exe" /cdl >> GACLog.txt /nologo
del AssemblyList.txt 2>> GACLog.txt
echo.-^> Restarting IIS...
iisreset /START > nul
echo Done.
echo Please see 'GACLog.txt' for details of GAC Install.
pause