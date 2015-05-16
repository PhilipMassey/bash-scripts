#!/bin/sh
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

thepath=$1
 
if [ ! -d $thepath ]
then
   echo "$thepath not a directory!"
   exit 1
fi

for myfile in `find ${thepath} -name "*.xls"`
do
    newfile=`(echo $myfile | tr [a-z] [A-Z])`
    echo "${newfile}"
    mv "${myfile}" "${newfile}"
done
IFS=$SAVEIFS
