#!/system/bin/sh

echo "You selected "Clearing profile data for all packages""
echo "Please wait, it will take a few minutes ..."
echo "------------------------------------------------------"

cmd package compile --reset -a

echo "Done"
echo "------------------------------------------------------"