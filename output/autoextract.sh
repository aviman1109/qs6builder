#!/bin/bash
project=$1
project_home=/home/${project}

rm -irf /tmp/${project}
rm -irf $project_home
unzip -q /home/source/drone/${project}-linux*.zip -d /tmp && echo "Success unzip" || echo "Failure unzip"
mv /tmp/${project}* /tmp/${project}/

ver=$(ls /home/source/drone/${project}-linux*.zip)
echo upgrading...${ver}
mv /home/source/drone/${project}-linux*.zip /home/source/old/

cd /tmp/${project}
if ./extractcmd.sh -path $project_home; then
    cd $project_home
    nohup $project_home/server.sh > /dev/null 2>&1 &
    echo "---upgraded--> ${ver}"
    date +"%Y/%m/%d %H:%M:%S upgraded [${project}] ${ver}" >> /home/setup/installed.txt
fi

