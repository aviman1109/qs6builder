#!/bin/bash
SettingFile=/tmp/qs-build/bin/local/${PLUGIN_MODULE}/settings.xml
FilePath=/tmp/qs-build/bin/local/${PLUGIN_MODULE}


setParameter (){
    if [ ! -z "${2}" ]; then
        # echo setting....${2} 
        sed -i 's/'"${1}"'/'"${2}"'/g' ${SettingFile} && echo "set ${1} complete" || echo "Failure set ${1}"
    else
    echo you need settings:${1}
    fi

}
echo setting...
count=0
setParameter PLUGIN_NAME ${PLUGIN_NAME} && count=`expr $count + 1` || echo "count=${count} not add"
setParameter PLUGIN_MODULE ${PLUGIN_MODULE} && count=`expr $count + 1` || echo "count=${count} not add"
setParameter PLUGIN_VERSION ${PLUGIN_VERSION} && count=`expr $count + 1` || echo "count=${count} not add"
setParameter PLUGIN_BASE ${PLUGIN_BASE} && count=`expr $count + 1` || echo "count=${count} not add"
setParameter PLUGIN_INITIALISM ${PLUGIN_INITIALISM} && count=`expr $count + 1` || echo "count=${count} not add"

x=${PLUGIN_PORT}
for i in {1..4};
do
    echo port:$i
    setParameter PLUGIN_PORT_$i ${x} && count=`expr $count + 1` || echo "count=${count} not add"
    x=`expr ${x} + 1`
done

cat ${SettingFile}
echo ==========end=setting===================
cd ${FilePath}
ls -al
if [ $count = 9 ]; then
    echo Building....
    ./build-linux.sh
    echo ===========end=build==================
else
   echo check your .drone.yml
fi

echo your output file
cd /tmp/qs-build/output/
ls -al
ls *linux*.zip

echo ==============================
file=*linux*.zip
filename=$file

if [ -f $filename ]; then
    cp * /${PLUGIN_BASE}/ && echo Success || echo Failure
else
   echo "There is nothing in output..."
fi

