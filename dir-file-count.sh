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

echo `date` >dir-file-count.log
echo $thepath
echo $thepath >>dir-file-count.log

 
# limit level of folder
#dirs=$(find $thepath -type d  | grep -v '^./.*/.*/')
dirs=$(find $thepath -type d  )
 
# loop thought each dir to get the number of files in each of subdir
for dir in $dirs
do
   count=$(find "$dir" -type f  | wc -l)     
   echo "$dir	$count" 
   echo "$dir	$count" >>dir-file-count.log

done
IFS=$SAVEIFS
