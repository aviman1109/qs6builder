#!/bin/sh
if [ ! -z "${2}" ]; then
    echo setting....${2} 
    sed -i 's/'"${1}"'/'"${2}"'/g' settings.xml && echo "set ${1} complete" || echo "Failure set ${1}"
else
   echo you need settings:${1}
fi

echo -------------------