#!/bin/bash


file1="/home/basal491/DriveSimRepo/miniHil/gen5/DriveSim_Build_5.20.36.0/Testcases/rm3259-1.xodr"
file2="/home/basal491/DriveSimRepo/miniHil/gen5/DriveSim_Build_5.20.36.0/Testcases/rm3259-3.xodr"
TEST_RESULT="Test_Result"
rm -r $TEST_RESULT
mkdir $TEST_RESULT
TESTCASE_PATH="/home/basal491/DriveSimRepo/miniHil/gen5/DriveSim_Build_5.20.36.0/Testcases"
Test=($(find  $TESTCASE_PATH  -name "*.xodr" -type f  ))
Vergleich_Fall_Nummer=0
vergleich="$(diff "${file1}" "${file2}" | grep "^>" | wc -l  )"
echo "$vergleich"

if [[  "$vergleich" -gt 5  ]]; then
   for i in 1 2 3 4 5
    do
    echo "$vergleich Failde $x"
   

    echo "$vergleich Passed $x"
   done
  else 
    echo ""
fi
    

