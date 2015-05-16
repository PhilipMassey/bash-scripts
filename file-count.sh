#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

thepath=.
 
# change your directory to command line if passed
# otherwise use home directory
[ $# -eq 1 ] && thepath=$1 || :
 
if [ ! -d $thepath ]
then
   echo "$thepath not a directory!"
   exit 1
fi
echo `date` >files-count.log
echo $thepath
echo $thepath >>file-count.log
 
# use find command to get all subdirs name in dirs variable
count=$(find "$thepath" -type f  | wc -l)     
echo "$dir	$count" 
echo "$dir	$count" >>file-count.log

IFS=$SAVEIFS
