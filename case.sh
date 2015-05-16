#!/bin/bash
HOST=`hostname`
echo "host is ${HOST}"

case ${HOST} in

'f86sacovn12')
   WL_HOME=/apps/opt/weblogic/wlserver_10.3.6
;;
'f86tpaovp03')
   WL_HOME=/apps/opt/weblogic/wlserver_10.3.6
;;
*)
   WL_HOME=/apps/opt/weblogic/wlserver_10.3
esac
 
echo "WL_HOME is $WL_HOME"

cd /apps/opt/weblogic/domains/wfm
. ${WL_HOME}/server/bin/setWLSEnv.sh 
java weblogic.Deployer -adminurl ${HOST}:7001 -userconfigfile /apps/opt/weblogic/domains/wfm/security/weblogic_config.properties -userkeyfile /apps/opt/weblogic/domains/wfm/security/weblogic_key.properties -listapps
