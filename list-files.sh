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
 
echo `date` >list-files.txt
echo $thepath
echo $thepath >>list-files.txt

for myfile in `find "${thepath}" -name "*" -print` 
do
   echo "${myfile}"
   echo "${myfile}" >>list-files.txt
	
done
IFS=$SAVEIFS
