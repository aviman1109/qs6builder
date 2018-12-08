#!/bin/sh
./setting.sh
../../ant/bin/ant -buildfile build.xml -logfile build.log -Dos=linux -Dmode=full
