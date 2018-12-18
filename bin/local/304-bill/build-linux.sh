#!/bin/sh
echo setting...
count=0
echo $count


if [ ! -z "${PLUGIN_MODULE}" ]; then
    echo ${PLUGIN_MODULE} 
    sed -i 's/PLUGIN_MODULE/'"${PLUGIN_MODULE}"'' settings.xml
    echo "set PLUGIN_MODULE complete"
    count=`expr $count + 1`
else
   echo you need settings:PLUGIN_MODULE
fi

if [ ! -z "${PLUGIN_VERSION}" ]; then
    sed -i 's/PLUGIN_VERSION/'"${PLUGIN_VERSION}"'' settings.xml
    echo "set PLUGIN_VERSION complete"
    count=`expr $count + 1`
else
   echo you need settings:PLUGIN_VERSION
fi

if [ ! -z "${PLUGIN_BASE}" ]; then
    sed -i 's/PLUGIN_BASE/'"${PLUGIN_BASE}"'' settings.xml
    echo "set PLUGIN_BASE complete"
    count=`expr $count + 1`
else
   echo you need settings:PLUGIN_BASE
fi

if [ ! -z "${PLUGIN_INITIALISM}" ]; then
    sed -i 's/PLUGIN_INITIALISM/'"${PLUGIN_INITIALISM}"'' settings.xml
    echo "set PLUGIN_INITIALISM complete"
    count=`expr $count + 1`
else
   echo you need settings:PLUGIN_INITIALISM
fi


if [ ! -z "${PLUGIN_PORT}" ]; then
    echo ${PLUGIN_PORT}
    x=${PLUGIN_PORT}
    sed -i 's/PLUGIN_PORT_1/'"${x}"'' settings.xml
    echo "set httpPort complete"
    x=`expr ${x} + 1`
    sed -i 's/PLUGIN_PORT_2/'"${x}"'' settings.xml
    echo "set httpsPort complete"
    x=`expr ${x} + 1`
    sed -i 's/PLUGIN_PORT_3/'"${x}"'' settings.xml
    echo "set ajpPort complete"
    x=`expr ${x} + 1`
    sed -i 's/PLUGIN_PORT_4/'"${x}"'' settings.xml
    echo "set shutdownPort complete"
    count=`expr $count + 1`
else
   echo you need settings:PLUGIN_PORT
fi

if [ $count = 5 ]; then
    ../../ant/bin/ant -buildfile build.xml -logfile build.log -Dos=linux -Dmode=full
else
   echo check your .drone.yml
fi

