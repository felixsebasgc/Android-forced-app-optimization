@echo off
title Android ART Forced Optimization

`:menu
cls

echo  Press a number to select an option
echo -------------------------------------
echo 1. Check ADB connection (List devices)
echo 2. All packages optimization speed-profile
echo 3. All packages full optimization
echo 4. Clearing profile data for all packages
echo Press 'Q' to QUIT
echo -------------------------------------
SET INPUT=
SET /P INPUT=Please select a number:


IF /I '%INPUT%'=='1' GOTO Selection1
IF /I '%INPUT%'=='2' GOTO Selection2
IF /I '%INPUT%'=='3' GOTO Selection3
IF /I '%INPUT%'=='4' GOTO Selection4
IF /I '%INPUT%'=='Q' GOTO Quit

cls

echo Invalid Input 
echo -----------------------------------------------
echo Please select a number from the Main Menu [1-6]
echo or select 'Q' to quit.
echo -----------------------------------------------
echo Press any key to continue...

pause>nul
goto menu

:: Pendiente, agregar una opción para seleccionar uno de los dispositivos conectados a la computadora.

:Selection1
:1
cls
	echo You selected "Check ADB connection (List devices)"
	echo --------------------------------------------------
adb devices
	echo Press any key to return to menu...
	pause>nul 
	goto menu

:Selection2
:2
cls
	echo You selected "All packages optimization speed-profile"
	echo Please wait, it will take a few minutes ...
	echo ------------------------------------------------------
echo STEP 1
adb shell cmd package compile -m speed-profile -f -a
echo STEP 2
adb shell cmd package compile -a -f --compile-layouts
echo STEP 3
adb shell cmd package bg-dexopt-job
	echo Press any key to return to menu...
	pause>nul 
	goto menu

:Selection3
:3
cls
	echo You selected "All packages full optimization"
	echo Please wait, it will take a few minutes ...
	echo ---------------------------------------------
echo STEP 1
adb shell cmd package compile -m speed -f -a
echo STEP 2
adb shell cmd package compile -a -f --compile-layouts
echo STEP 3
adb shell cmd package bg-dexopt-job
	echo Press any key to return to menu...
	pause>nul 
	goto menu
	
:Selection4
:4
cls
	echo You selected "Clearing profile data for all packages"
	echo Please wait, it will take a few minutes ...
	echo -----------------------------------------------------
adb shell cmd package compile -m speed -f -a
	echo Press any key to return to menu...
	pause>nul 
	goto menu



:Quit
cls
echo ========Thank you for using this tool========
echo ---------------------------------------------
echo ========Press any key to continue ===========
pause>nul
exit'
