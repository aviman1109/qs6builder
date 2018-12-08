#!/bin/sh
echo setting...
echo ${PLUGIN_MODULE} ${PLUGIN_VERSION} ${PLUGIN_BASE}
# sed -i 's/<'"$1"\>'.*</<'"$1"'\>'"$2"'</g' $3
# sed -i 's/value="PLUGIN_MODULE"/>/value="'"${PLUGIN_MODULE}"'"' settings.xml
# <'"$1"\>'.*<

if [ ! -z "${PLUGIN_MODULE}" ]; then
    echo ${PLUGIN_MODULE} 
    sed -i 's/value="PLUGIN_MODULE"/value="'"${PLUGIN_MODULE}"'"</g' /tmp/qs-build/bin/local/304-bill/settings.xml
    echo "set PLUGIN_MODULE complete"
else
   echo you need settings:PLUGIN_MODULE
fi
if [ ! -z "${PLUGIN_VERSION}" ]; then
    sed -i 's/value="PLUGIN_VERSION"/value="'"${PLUGIN_VERSION}"'"</g' /tmp/qs-build/bin/local/304-bill/settings.xml
    echo "set PLUGIN_VERSION complete"
else
   echo you need settings:PLUGIN_VERSION
fi
if [ ! -z "${PLUGIN_BASE}" ]; then
    sed -i 's/PLUGIN_BASE/'"${PLUGIN_BASE}"'</g' /tmp/qs-build/bin/local/304-bill/settings.xml
    echo "set PLUGIN_BASE complete"
else
   echo you need settings:PLUGIN_BASE
fi
../../ant/bin/ant -buildfile build.xml -logfile build.log -Dos=linux -Dmode=full
