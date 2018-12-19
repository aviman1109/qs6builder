#!/bin/bash

echo ░░██████▒██░░░██░░░▄████▄░░██░▄█▀░░░░░░░██████╗░██╗░░░██╗░██████╗
echo ░▒██░░░░▒██░░░██▒▒██▀░░▀█░░██▄█▒░░░░░░░░██╔══██╗██║░░░██║██╔════╝
echo ░▒████░░▒██░░░██░▒██░░░░▄░░███▄░░░░░░░░░██████╔╝██║░░░██║██║░░███╗
echo ░▒██▒░░░▒██░░░██░▒██▄░░▄█░░██░█▄░░░░░░░░██╔══██╗██║░░░██║██║░░░██║
echo ░▒██░░░░▒██████▓░▒▒████▀░░▒██▒░█▄░░░░░░░██████╔╝╚██████╔╝╚██████╔╝
echo ░░▒░░░░░░▒▒▒░▒░▒░░░▒▒▒▒░░░▒▒▒▒░▒▒░░░░░░░╚═════╝░░╚═════╝░░╚═════╝
echo ░░▒░░░░░░░▒░░░░░░░░░░░▒░░░░░░▒░▒░
echo ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo ░░░░░░░░░░░░░░░░░░
　
echo setting...
count=0

./setParameter.sh PLUGIN_MODULE ${PLUGIN_MODULE} && count=`expr $count + 1` || echo "count=${count} not add"
./setParameter.sh PLUGIN_VERSION ${PLUGIN_VERSION} && count=`expr $count + 1` || echo "count=${count} not add"
./setParameter.sh PLUGIN_BASE ${PLUGIN_BASE} && count=`expr $count + 1` || echo "count=${count} not add"
./setParameter.sh PLUGIN_INITIALISM ${PLUGIN_INITIALISM} && count=`expr $count + 1` || echo "count=${count} not add"

x=${PLUGIN_PORT}
for i in {1..4};
do
    echo port:$i
    ./setParameter.sh PLUGIN_PORT_$i ${x} && count=`expr $count + 1` || echo "count=${count} not add"
    x=`expr ${x} + 1`
done



if [ $count = 8 ]; then
    echo Building....
    ../../ant/bin/ant -buildfile build.xml -logfile build.log -Dos=linux -Dmode=full
    echo ===========end=build==================
else
   echo check your .drone.yml
fi

echo list output
cd /tmp/qs-build/output/
ls *linux*.zip

echo ==============================
# chmod 777 -R /tmp/qs-build/output/
# ls /tmp/qs-build/output/
file=*linux*.zip
echo $file
filename=$file
if [ -f $filename ]; then
    cp ${file} /${PLUGIN_BASE}/ && echo "Success Build!!!!" || echo "Failure with something..."
else
   echo "There is nothing in output..."
fi