#!/bin/bash
echo setting...
count=0
echo $count

./setParameter.sh PLUGIN_MODULE ${PLUGIN_MODULE} && count=`expr $count + 1` || echo "count=${count} not add"
echo $count
./setParameter.sh PLUGIN_VERSION ${PLUGIN_VERSION} && count=`expr $count + 1` || echo "count=${count} not add"
echo $count
./setParameter.sh PLUGIN_BASE ${PLUGIN_BASE} && count=`expr $count + 1` || echo "count=${count} not add"
echo $count
./setParameter.sh PLUGIN_INITIALISM ${PLUGIN_INITIALISM} && count=`expr $count + 1` || echo "count=${count} not add"
echo $count

x=${PLUGIN_PORT}
for i in {1..4};
do
    echo $i
    ./setParameter.sh PLUGIN_PORT_$i ${x} && count=`expr $count + 1` || echo "count=${count} not add"
    x=`expr ${x} + 1`
    echo $count
done


# ./setParameter.sh PLUGIN_INITIALISM ${PLUGIN_INITIALISM} && count=`expr $count + 1` || echo "count=${count} not add"
# echo $count
# if [ ! -z "${PLUGIN_VERSION}" ]; then
#     sed -i 's/PLUGIN_VERSION/'"${PLUGIN_VERSION}"'/' settings.xml && echo "set PLUGIN_VERSION complete" || echo "Failure set PLUGIN_VERSION"
#     count=`expr $count + 1`
# else
#    echo you need settings:PLUGIN_VERSION
# fi

# if [ ! -z "${PLUGIN_BASE}" ]; then
#     sed -i 's/PLUGIN_BASE/'"${PLUGIN_BASE}"'/' settings.xml && echo "set PLUGIN_BASE complete" || echo "Failure set PLUGIN_BASE"
#     count=`expr $count + 1`
# else
#    echo you need settings:PLUGIN_BASE
# fi

# if [ ! -z "${PLUGIN_INITIALISM}" ]; then
#     sed -i 's/PLUGIN_INITIALISM/'"${PLUGIN_INITIALISM}"'/' settings.xml && echo "set PLUGIN_INITIALISM complete" || echo "Failure set PLUGIN_INITIALISM"
#     count=`expr $count + 1`
# else
#    echo you need settings:PLUGIN_INITIALISM
# fi


# if [ ! -z "${PLUGIN_PORT}" ]; then
#     echo ${PLUGIN_PORT}
#     x=${PLUGIN_PORT}
#     sed -i 's/PLUGIN_PORT_1/'"${x}"'/' settings.xml && echo "set httpPort complete" || echo "Failure set httpPort"
#     x=`expr ${x} + 1`
#     sed -i 's/PLUGIN_PORT_2/'"${x}"'/' settings.xml && echo "set httpsPort complete" || echo "Failure set httpsPort"
#     x=`expr ${x} + 1`
#     sed -i 's/PLUGIN_PORT_3/'"${x}"'/' settings.xml && echo "set ajpPort complete" || echo "Failure set ajpPort"
#     x=`expr ${x} + 1`
#     sed -i 's/PLUGIN_PORT_4/'"${x}"'/' settings.xml && echo "set shutdownPort complete" || echo "Failure set shutdownPort"
#     count=`expr $count + 1`
# else
#    echo you need settings:PLUGIN_PORT
# fi

cat settings.xml

if [ $count = 5 ]; then
    ../../ant/bin/ant -buildfile build.xml -logfile build.log -Dos=linux -Dmode=full
else
   echo check your .drone.yml
fi

file="/tmp/qs-build/output/*-linux*.zip"
echo $file
if [ -f "${file}" ]; then
    cp ${file} /${PLUGIN_BASE}/ && echo "Success Build!!!!" || echo "Failure with something..."
else
   echo "There is nothing in output..."
fi