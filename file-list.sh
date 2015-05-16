#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

START=.
 
# change your directory to command line if passed
# otherwise use home directory
[ $# -eq 1 ] && START=$1 || :
 
if [ ! -d $START ]
then
   echo "$START not a directory!"
   exit 1
fi
 
# use find command to get all subdirs name in DIRS variable
files=$(find $START -type f  | grep -v '^./.*/.*/')
 
# loop thought each dir to get the number of files in each of subdir
for afile in files
do
   echo "${afile}" >> file-list.log
done
IFS=$SAVEIFS

