#!/bin/bash
project=$1
project_home=/home/${project}

rm -irf /tmp/${project}

unzip -q /home/source/drone/${project}-linux*.zip -d /tmp && echo "Success unzip" || echo "Failure unzip"
mv /tmp/${project}* /tmp/${project}/

ver=$(ls /home/source/drone/${project}-linux*.zip)
echo upgrading...${ver}
mv /home/source/drone/${project}-linux*.zip /home/source/old/

cd /tmp/${project}
if ./upgradecmd.sh -path $project_home >> upgradelog.txt; then
    echo =====upgraded=====
    cd $project_home
    nohup $project_home/server.sh > /dev/null 2>&1 &
    echo "---upgraded--> ${ver}"
    date +"%Y/%m/%d %H:%M:%S upgraded [${project}] ${ver}" >> /home/setup/installed.txt
fi

