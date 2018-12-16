@echo off

set    zip=bubbles.zip
set ifiles=bubbles.10b+bubbles.11b+bubbles.12b+bubbles.1b+bubbles.2b+bubbles.3b+bubbles.4b+bubbles.5b+bubbles.6b+bubbles.7b+bubbles.8b+bubbles.9b+bubbles.snd+decoder.4+decoder.6
set  ofile=a.bubbles.rom

rem =====================================
setlocal ENABLEDELAYEDEXPANSION

set pwd=%~dp0
echo.
echo.

if EXIST %zip% (

	!pwd!7za x -otmp %zip%
	if !ERRORLEVEL! EQU 0 ( 
		cd tmp

		copy /b/y %ifiles% !pwd!%ofile%
		if !ERRORLEVEL! EQU 0 ( 
			echo.
			echo ** done **
			echo.
			echo Copy "%ofile%" into root of SD card
		)
		cd !pwd!
		rmdir /s /q tmp
	)

) else (

	echo Error: Cannot find "%zip%" file
	echo.
	echo Put "%zip%", "7za.exe" and "%~nx0" into the same directory
)

echo.
echo.
pause
