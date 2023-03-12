#!/system/bin/sh

echo "You selected "All packages optimization speed-profile""
echo "Please wait, it will take a few minutes ..."
echo "------------------------------------------------------"

echo "STEP 1"
cmd package compile -m speed -f -a


echo "STEP 2"
cmd package compile -a -f --compile-layouts


echo "STEP 3"
cmd package bg-dexopt-job


echo "Done"
echo "------------------------------------------------------"