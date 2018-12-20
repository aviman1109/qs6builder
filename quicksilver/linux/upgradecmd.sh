PIDS=`ps aux | grep pgw | awk '{print $2}' | xargs`
read -a PID <<< "${PIDS}"
for ((i=0; i < ${#PID[@]}; i++))
do
    echo $i ${PID[$i]}
    ppid=${PID[$i]}
    # echo $ppid
    if ! kill $ppid > /dev/null 2>&1; then
    echo "Could not send SIGTERM to process $ppid" >&2
    fi
done

bin/jre/bin/java -cp "bin/lib/*" com.jeedsoft.quicksilver.toolset.pack.upgrade.UpgradeCmd $@