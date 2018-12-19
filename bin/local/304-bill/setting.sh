#!/bin/sh
echo setting...
echo ${PLUGIN_MODULE} ${PLUGIN_VERSION} ${PLUGIN_BASE}
# sed -i 's/<'"$1"\>'.*</<'"$1"'\>'"$2"'</g' $3
# sed -i 's/value="PLUGIN_MODULE"/>/value="'"${PLUGIN_MODULE}"'"' settings.xml
# <'"$1"\>'.*<

if [ ! -z "${PLUGIN_MODULE}" ]; then
    echo ${PLUGIN_MODULE} 
    sed -i 's/PLUGIN_MODULE/'"${PLUGIN_MODULE}"'' settings.xml
    echo "set PLUGIN_MODULE complete"
else
   echo you need settings:PLUGIN_MODULE
fi

if [ ! -z "${PLUGIN_VERSION}" ]; then
    sed -i 's/PLUGIN_VERSION/'"${PLUGIN_VERSION}"'' settings.xml
    echo "set PLUGIN_VERSION complete"
else
   echo you need settings:PLUGIN_VERSION
fi

if [ ! -z "${PLUGIN_BASE}" ]; then
    sed -i 's/PLUGIN_BASE/'"${PLUGIN_BASE}"'' settings.xml
    echo "set PLUGIN_BASE complete"
else
   echo you need settings:PLUGIN_BASE
fi

if [ ! -z "${PLUGIN_INITIALISM}" ]; then
    sed -i 's/PLUGIN_INITIALISM/'"${PLUGIN_INITIALISM}"'' settings.xml
    echo "set PLUGIN_INITIALISM complete"
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
else
   echo you need settings:PLUGIN_PORT
fi