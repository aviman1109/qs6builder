#!/bin/sh
echo setting...
echo ${PLUGIN_MODULE} ${PLUGIN_VERSION} ${PLUGIN_BASE}
# sed -i 's/<'"$1"\>'.*</<'"$1"'\>'"$2"'</g' $3
# sed -i 's/value="PLUGIN_MODULE"/>/value="'"${PLUGIN_MODULE}"'"' settings.xml
# <'"$1"\>'.*<
if [ ! -z "${PLUGIN_MODULE}" ]; then
    sed -i 's/PLUGIN_MODULE/pgw' settings.xml
    echo "set PLUGIN_MODULE complete"
else
   echo you need settings:PLUGIN_MODULE
fi
if [ ! -z "${PLUGIN_VERSION}" ]; then
    sed -i '8s/PLUGIN_VERSION/'"${PLUGIN_VERSION}"'' settings.xml
    echo "set PLUGIN_VERSION complete"
else
   echo you need settings:PLUGIN_VERSION
fi
if [ ! -z "${PLUGIN_BASE}" ]; then
    sed -i '9s/PLUGIN_BASE/'"${PLUGIN_BASE}"'' settings.xml
    echo "set PLUGIN_BASE complete"
else
   echo you need settings:PLUGIN_BASE
fi