#!/bin/sh
echo setting...
count=0
echo $count



if [ ! -z "${PLUGIN_MODULE}" ]; then
    echo setting ${PLUGIN_MODULE} 
    sed -i 's/PLUGIN_MODULE/'"${PLUGIN_MODULE}"'/g' /tmp/qs-build/bin/local/304-bill/settings.xml
    echo "set PLUGIN_MODULE complete"
    count='expr $count + 1'
else
   echo you need settings:PLUGIN_MODULE
fi
if [ ! -z "${PLUGIN_VERSION}" ]; then
    echo setting ${PLUGIN_VERSION} 
    sed -i 's/PLUGIN_VERSION/'"${PLUGIN_VERSION}"'/g' /tmp/qs-build/bin/local/304-bill/settings.xml
    echo "set PLUGIN_VERSION complete"
    count='expr $count + 1'
else
   echo you need settings:PLUGIN_VERSION
fi
if [ ! -z "${PLUGIN_BASE}" ]; then
    echo setting ${PLUGIN_BASE} 
    sed -i 's/PLUGIN_BASE/'"${PLUGIN_BASE}"'/g' /tmp/qs-build/bin/local/304-bill/settings.xml
    echo "set PLUGIN_BASE complete"
    count='expr $count + 1'
else
   echo you need settings:PLUGIN_BASE
fi

if [ $count = 3 ]; then
    ../../ant/bin/ant -buildfile build.xml -logfile build.log -Dos=linux -Dmode=full
else
   echo check your .drone.yml
fi

