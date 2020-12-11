#!/bin/bash
TEST_RESULT="Test_Result"
rm -r $TEST_RESULT
mkdir $TEST_RESULT
N=0
N1=0
directory="/home/basal491/DriveSimRepo/miniHil/gen5/DriveSim_Build_5.20.36.0/Testcases/*"
TESTCASE_PATH="/home/basal491/DriveSimRepo/miniHil/gen5/DriveSim_Build_5.20.36.0/Testcases"

Test=($(find  $TESTCASE_PATH  -name "*.xodr" -type f  ))
vergleich= "$(diff "${file}" "${filex}" | grep "^>" | wc -l  )"
output="$(diff -q "$file1" "$file2")"

for file1 in ${Test[*]}
do
    for file2 in ${Test[*]}
    do
       if cmp -s "$file1" "$file2"
        then
         FILENAME=`basename $file1`
         FILENAME1=`basename $file2`
         

         if [ "$FILENAME" != "$FILENAME1" ]; then
          
          echo "$FILENAME und $FILENAME1 sind Identisch"
         fi
        
           
      fi
    done
  
done 

TESTCASE_PATH="/home/basal491/DriveSimRepo/miniHil/gen5/DriveSim_Build_5.20.36.0/Testcases"
Test=($(find  $TESTCASE_PATH  -name "*.xodr" -type f  ))
Vergleich_Fall_Nummer=0
   echo   >> $TEST_RESULT/xodrvergleichE.txt 2>&1
for file in ${Test[*]}
do
    for filex in ${Test[*]}
    do

          FILENAME=`basename $file`
         FILENAME1=`basename $filex`
          # vergleich1="$(diff "${FILENAME}" "${FILENAME1}")"
           vergleich="$(diff "${file}" "${filex}" | grep "^>" | wc -l  )"


            if [[  "$vergleich" -gt 5  ]]
             then
            echo "$FILENAME  $FILENAME1  Verschiedne  $vergleich $x" 
          elif [[  "$vergleich" -gt 0  ]]
             then
             echo "$FILENAME  $FILENAME1  Teilwiese_Idetisch  $vergleich"
          else 
             echo "" 
           fi
                
    done
done 
          
