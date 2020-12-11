#!/bin/bash


S_PATH="/home/basal491/DriveSimRepo/miniHil/gen5/DriveSim_Build_5.20.36.0/DriveSim"
TESTCASE_PATH="/home/basal491/DriveSimRepo/miniHil/gen5/DriveSim_Build_5.20.36.0/Testcases"
TESTCASES=($(find $TESTCASE_PATH -type f -name '*.xml'))
Test=($(find  $TESTCASE_PATH  -name "*.xodr" -type f  ))
ParDir="$( echo $(cd ../ && pwd) )/DriveSim_Build_5.20.36.0/DriveSim"

echo "$ParDir"
TEST_RESULT="Test_Result"
STRING="OpenDRIVE XML Schema Validation failed"
FILE="$( echo $(cd ../ && pwd) )/DriveSim_Build_5.20.36.0/Test_Result/used_xdor_files.txt"
FILE1="$( echo $(cd ../ && pwd) )/DriveSim_Build_5.20.36.0/Test_Result/Xodr_vergleich.txt"
number=0
rm -r $TEST_RESULT
mkdir $TEST_RESULT
echo "$FILE"
echo "$FILE1"
#echo  >> $TEST_RESULT/Xodr_vergleich.txt 2>&1 


for file1 in ${Test[*]}
        do
             FILENAME=`basename $file1`
               # echo -e "\n" >> $TEST_RESULT/Xodr_vergleich.txt 2>&1             
              #   echo -n "$FILENAME,  "  >> $TEST_RESULT/Xodr_vergleich.txt 2>&1
                 for file2 in ${Test[*]}
                  do
                    if cmp -s "$file1" "$file2"
                     then
                        FILENAME=`basename $file1`
                        FILENAME1=`basename $file2`
                        
                         NUMOFLINES=$(wc -l < "$file2")
                       date1=($(grep  -P -o -e '(?<=date=").*?(?=")' "$file2"))
                      #  data2=$(xmlstarlet sel -t -v $file2 @data -n)

                          if [ "$FILENAME" != "$FILENAME1" ]; then
                           # echo "$FILENAME  $FILENAME1 $NUMOFLINES Identisch"
                         #   echo -n " V:$data1 $FILENAME1 " >> $TEST_RESULT/Xodr_vergleich.txt 2>&1
                           # echo -n " V:$date1/$FILENAME1 " 
                         echo "$date1"
                  
                      fi
        
                        
                  
                      fi
                    
                         
            done
        
      done
mydir=$(dirname "$[0]")



echo "$mydir"
   echo "$V"
