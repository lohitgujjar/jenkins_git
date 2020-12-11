#!/bin/bash

TESTCASE_PATH="$( echo $(cd ../ && pwd) )/DriveSim_Build_5.20.36.0/Testcases"
Array=()
TEST2=($(find $TESTCASE_PATH -type f -name '*.xlmr'))
FILE2="$( echo $(cd ../ && pwd) )/DriveSim_Build_5.20.36.0/static/unused_xdor_files.txt"
for i in ${TEST2[*]}
do

 title=($(grep -oPm1 "(?<=<xodrFile>)[^<]+"  "$i"))
FILENAME=`basename $i`

#echo "$title"

 #echo $FILENAME
if grep -Fxq "$title" $FILE2
    then
       let "BenutzteXodrFiles +=1"
          FILENAME1=`basename $FILE2`
            echo "$FILENAME found in $FILE2"
                Array1=("$FILENAME1")
                Array=("${Array1[*]}")
    else
           echo ""

 fi
done

echo "${Array[*]}"
  unset Array
echo "${Array[*]}"
