#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

logfile=copy-files.log
thepath=.

# change directory to command line if passed otherwise use current directory
[ $# -eq 1 ] && thepath=$1 || :

if [ ! -d $thepath ]
then
   echo "$thepath not a directory!"
   exit 1
fi

echo `date` >> $logfile
echo $thepath
echo $thepath >> $logfile

for myfile in `find "${thepath}"  -maxdepth 1 -type f -name "*.sh"`
do
   afile=$(echo $myfile | sed -e "s/.sh/.sh.0/g")
   echo "${myfile} - $afile"
   echo "${myfile} - $afile" >>$logfile
   cp $myfile $afile

done
IFS=$SAVEIFS
