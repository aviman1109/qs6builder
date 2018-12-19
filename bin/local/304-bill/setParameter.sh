#!/bin/sh
if [ $# -eq 3 ]; then
    sed -i 's/value="'"$1"'"/value="'"$2"'"</g' $3
else
   echo error
fi