#!/bin/bash
project=$1
project_home=/home/${project}

rm -irf /tmp/${project}
rm -irf $project_home
unzip -q /home/source/drone/${project}-linux*.zip -d /tmp && echo "Success unzip" || echo "Failure unzip"
mv /tmp/${project}* /tmp/${project}/

ver=$(ls /home/source/drone/${project}-linux*.zip)
echo extracting...${ver}
mv /home/source/drone/${project}-linux*.zip /home/source/old/

cd /tmp/${project}
if ./extractcmd.sh -path $project_home >> extractlog.txt; then
    echo =====extracted=====
    cd /home/source/drone
    cp -f *.xml $project_home/apache-tomcat/extension/${project}/config/
    cp -f application.properties $project_home/apache-tomcat/extension/${project}/config/
    cd $project_home/tool
    ./dsinitcmd.sh -ds default >> dsinitlog.txt
    echo =====dsinited=====
    cd $project_home
    ./server.sh > /dev/null 2>&1 &
    echo "---extracted--> ${ver}"
    date +"%Y/%m/%d %H:%M:%S extracted [${project}] ${ver}" >> /home/setup/installed.txt
fi

