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


#DS_PATH="/home/basal491/DriveSimRepo/miniHil/gen5/DriveSim_Build_5.20.36.0/DriveSim"
#TESTCASE_PATH="/home/basal491/DriveSimRepo/miniHil/gen5/DriveSim_Build_5.20.36.0/Testcases"
#DS_PATH="$( echo $(cd ../ && pwd) )/DriveSim_Build_5.20.36.0/DriveSim"
DS_PATH="$1"
#TESTCASE_PATH="$( echo $(cd ../ && pwd) )/DriveSim_Build_5.20.36.0/Testcases"
TESTCASE_PATH="$@"
TESTCASES=($(find $TESTCASE_PATH -type f -name '*.xml'))
Test=($(find  $TESTCASE_PATH  -name "*.xodr" -type f  ))
TEST2=($(find $TESTCASE_PATH -type f -name '*.xlmr'))
#DS_PATH1=$(dirname "$(which /DriveSim_Build_5.20.36.0/DriveSim)")
Array=()
Array1=()
static="static"
STRING="OpenDRIVE XML Schema Validation failed"
FILE="$( echo $(cd ../ && pwd) )/DriveSim_Build_5.20.36.0/static/used_xdor_files.txt"
FILE1="$( echo $(cd ../ && pwd) )/DriveSim_Build_5.20.36.0/static/Xodr_vergleich.txt"
FILE2="$( echo $(cd ../ && pwd) )/DriveSim_Build_5.20.36.0/static/unused_xdor_files.txt"
rm -r $static
mkdir $static
#echo "TESTFÄLLE ; FALL; Xodr.NAME">>$TEST_RESULT/Result_Testcases.log 2>&1
Alletestcases=0
FaildTestcases=0
SuccesTestcases=0
AlleXodrFiles=0
BenutzteXodrFiles=0
UnbenutzteXodrFiles=0
Testcase=0
for item in ${TESTCASES[*]}
do
# Nur Testfall Name bentuzten nicht ganz Path
FILENAME1=`basename $item`
echo $FILENAME1
let "Alletestcases +=1"
let "Testcase +=1"
# Terminl output in Terminal:info.log File Organzieren und zeigen
    echo "Testcase Nummber:""$Testcase" >> $static/Terminal_info.log 2>&1
# DriveSim ,t Testfall lufen lassen
    $DS_PATH -s SoftwareConfig.xml -t $item >> $item.log 2>&1
	echo $DS_PATH
    echo "$DS_PATH" >> $static/Terminal_info.log 2>&1
	echo $item
    echo "$item" >> $static/Terminal_info.log 2>&1
	echo $item
    echo "$item" >> $static/Terminal_info.log 2>&1
	echo $item.log
    echo "$item""log" >> $static/Terminal_info.log 2>&1
# Xodr.File Name von dem geöffneten Testfall auslesn
names=($(grep  -P -o -e '(?<=value=").*?(?=")' "$item"))
   #echo $names

   ## String="$names"
   #Testfall Name in used_xdor_files.txt zeigen 
    echo "$names" >> $static/used_xdor_files.txt 2>&1

# ob Testfall mit dem Drive Sim nicht funktioniert, dann ../..
    if grep -F "$STRING" $item.log

        then
              # Überbrüfen, ob ein Xodr File gibt (Mansche Testfälle haben kein Xodr.File und trotzdem werden Sie als Succes gerechnet, deshalb musste ich Sie filtern)
            if [[ -n $names ]]; then
            echo "$FILENAME1""  ,$names" ",läuft_nicht ,Failed" >> $static/Result_Testcases.txt 2>&1
              let "FaildTestcases +=1"
            else 
            echo "$FILENAME1""  ,X$names" " ,läuft_nicht, Failed" >> $static/Result_Testcases.txt 2>&1
              let "FaildTestcases +=1"
             fi

            unlink $item.log
    else
            if  [[ -n $names ]]; then
            echo "$FILENAME1""  ,$names" " ,läuft ,Success" >> $static/Result_Testcases.txt 2>&1
              let "SuccesTestcases +=1"
            else 
            echo "$FILENAME1""  ,$names" " ,läuft_nicht,Failed" >> $static/Result_Testcases.txt 2>&1
              let "FaildTestcases +=1"
             fi

      echo "$STRING" >> $static/Terminal_info.log 2>&1
        unlink $item.log
    fi
      echo "." >> $static/Terminal_info.log 2>&1
done
# Statistik in Testfälle-analuse.txt File zeigen
echo "$Alletestcases $SuccesTestcases $FaildTestcases">>$static/Testfälle_analyse.txt 2>&1
#echo $FILENAME

#echo $names

# Die Aufgabe von diesem Abschnitt ist die alle Xodr.File Namen dierekt von Testfälle-Ordner auszulessen und jeder einzige Name von dem Ordner wird mit dem used_xdor_files.txt File vergliechen. Ob der Name in .txt File exstiert ist, dann der ist benutuzt, sonst der Xodr. File Name ist unbenutzt und wird in unused_xdor_files.txt File eingesetzt
for i in ${Test[*]}
do
let "AlleXodrFiles+=1"

FILENAME=`basename $i`

 #echo $FILENAME
if grep -Fxq "$FILENAME" $FILE
    then
       let "BenutzteXodrFiles +=1"
            echo "$FILENAME found in $FILE"
    else
     let "UnbenutzteXodrFiles +=1"
    echo "$FILENAME" >> $static/unused_xdor_files.txt 2>&1
 fi
done
echo "$AlleXodrFiles $BenutzteXodrFiles $UnbenutzteXodrFiles">>$static/xodr_Files_analyse.txt 2>&1
#echo >> $static/Xodr_vergleich.txt 2>&1 




  
        for file1 in ${Test[*]}
          do 
             FILENAME=`basename $file1`
            if grep -q $FILENAME "$FILE1"; then
               echo "Testfall wurde vergliechen"
             else
                #echo -e "\n" >> $static/Xodr_vergleich.txt 2>&1
                #echo "$FILENAME  " >> $static/Xodr_vergleich.txt 2>&1
                for file2 in ${Test[*]}
                  do
                    if cmp -s "$file1" "$file2"
                     then
                        FILENAME=`basename $file1`
                        FILENAME1=`basename $file2`
                      

                           if [ "$FILENAME" != "$FILENAME1" ]; then
                            echo "$FILENAME  $FILENAME1 Identisch"
                              Array+=("$FILENAME1")
                              #Array1=("$FILENAME")
                              #Array= (${Array1[*]})
                  
                      fi
                    fi

            done
                if (( ${#Array[*]} )); then

                 echo "$FILENAME,"" ${Array[*]}">> $static/Xodr_vergleich.txt
                 echo "$FILENAME"" ${Array[*]}"
                 unset Array
               fi

                 unset Array

             
        fi
      done
          unset Array
 
for file in ${Test[*]}
do
    for filex in ${Test[*]}
    do

          FILENAME=`basename $file`
         FILENAME1=`basename $filex`
          # vergleich1="$(diff "${FILENAME}" "${FILENAME1}")"
           vergleich="$(diff "${file}" "${filex}" | grep "^>" | wc -l  )"
           vergleich1="$(diff "${file}" "${filex}" )"
            NUMOFLINES=$(wc -l < "$file")
            date1=($(grep  -P -o -e '(?<=version=").*?(?=")' "$file"))
            date2=($(grep  -P -o -e '(?<=version=").*?(?=")' "$filex"))
            if [[  "$vergleich" -gt 10  ]]
             then
            echo "$FILENAME  $FILENAME1  Verschieden  "$vergleich von_$NUMOFLINES " $x"  >> $static/Verschieden_Xodr.txt
          elif [[  "$vergleich" -gt 0  ]]
             then
             echo "V:$date1:$FILENAME  V:$date2:$FILENAME1  $vergleich:von:$NUMOFLINES,, $x" >> $static/Xodr_vergleichV.txt 2>&1
             echo "$FILENAME  $FILENAME1: $vergleich" >> $static/output_Xodr.txt
             echo "" >> $static/output_Xodr.txt
              echo "$vergleich1" >> $static/output_Xodr.txt
          else 
             echo "" 
           fi

                
    done
done 
for i in ${TEST2[*]}
do

 title=($(grep -oPm1 "(?<=<xodrFile>)[^<]+"  "$i"))
FILENAME=`basename $i`

 #echo $FILENAME
if grep -Fxq "$title" $FILE2
    then
       #let "BenutzteXodrFiles +=1"
            echo "$FILE2 found in $FILENAME"
    echo "$title" " $FILENAME">> $static/Xmlr_xdor_files.txt 2>&1
    else
           echo "1"

 fi
done
# python3 app.py
echo "finished"

exit 1
