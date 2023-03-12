#!/bin/sh
Android ART Forced Optimization

clear

while true do
echo  "Press a number to select an option"
echo "-------------------------------------"
echo "1. Check ADB connection (List devices)"
echo "2. All packages optimization speed-profile"
echo "3. All packages full optimization"
echo "4. Clearing profile data for all packages"
echo "Press 'Q' to QUIT"
echo "-------------------------------------"
echo -n "Please select a number: "
read input

case $input in

	1)
	clear
		echo "You selected "Check ADB connection (List devices)""
		echo "--------------------------------------------------"
	adb devices
		echo "Press any key to return to menu..."
		;;

	2)
	clear
		echo "You selected "All packages optimization speed-profile""
		echo "Please wait, it will take a few minutes ..."
		echo "------------------------------------------------------"
	echo "STEP 1"
	adb shell cmd package compile -m speed-profile -f -a
	echo "STEP 2"
	adb shell cmd package compile -a -f --compile-layouts
	echo "STEP 3"
	adb shell cmd package bg-dexopt-job
		;;

	3)
	clear
		echo "You selected "All packages full optimization""
		echo "Please wait, it will take a few minutes ..."
		echo "---------------------------------------------"
	echo "STEP 1"
	adb shell cmd package compile -m speed -f -a
	echo "STEP 2"
	adb shell cmd package compile -a -f --compile-layouts
	echo "STEP 3"
	adb shell cmd package bg-dexopt-job
		;;
	
	4)
	clear
		echo "You selected "Clearing profile data for all packages""
		echo Please wait, it will take a few minutes ...
		echo -----------------------------------------------------
	adb shell cmd package compile --reset -a
		;;


	q)

	clear
	echo "========Thank you for using this tool========"
	echo "---------------------------------------------"
	echo "========Press any key to continue ==========="
	exit
	*)
	clear
	echo "Invalid Input"
	echo "-----------------------------------------------"
	echo "Please select a number from the Main Menu [1-6]"
	echo "or select 'Q' to quit."
	echo "-----------------------------------------------"
	echo "Press any key to continue..."
	esac

done