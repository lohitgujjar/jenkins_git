#!/bin/bash

#DS_PATH="/home/lovee692/MiniHil/Gen5/DriveSim_Build_5.20.26.0"
#TESTCASE_PATH=$(find ~ -type d -name "*Testcase*" -print 2>/dev/null)
#TESTCASES=($(find $TESTCASE_PATH -type f -name '*.xml'))
#TEST_RESULT="Test_Result"
#STRING="OpenDRIVE XML Schema Validation failed"##

#rm -r $TEST_RESULT
#mkdir $TEST_RESULT

#for item in ${TESTCASES[*]}
#do
#    $DS_PATH -s SoftwareConfig.xml -t $item >> $item.log 2>&1
#    if grep -F "$STRING" $item.log
#        then
#            echo "$item" >> $TEST_RESULT/test.log 2>&1
#            unlink $item.log
#    else
#        unlink $item.log
#    fi
#done
#echo "finished"
#exit 1

DS_PATH="/home/basal491/DriveSimRepo/miniHil/gen5/DriveSim_Build_5.20.36.0"
TESTCASE_PATH="/home/basal491/DriveSimRepo/miniHil/gen5/DriveSim_Build_5.20.36.0/Testcases"
TESTCASES=($(find $TESTCASE_PATH -type f -name '*.xml'))

TEST_RESULT="Test_Result"
STRING="OpenDRIVE XML Schema Validation failed"

rm -r $TEST_RESULT
mkdir $TEST_RESULT

for item in ${TESTCASES[*]}
do
    $DS_PATH -s SoftwareConfig.xml -t $item >> $item.log 2>&1
	echo $DS_PATH
	echo $item
	echo $item
	echo $item.log
    if grep -F "$STRING" $item.log
        then
            echo "$item" >> $TEST_RESULT/test.log 2>&1
            unlink $item.log
    else
        unlink $item.log
    fi
done
echo "finished"
exit 1
