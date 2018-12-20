PIDS=`ps aux | grep pgw | awk '{print $2}' | xargs`
echo $$

read -a PID <<< "${PIDS}"
for ((i=0; i < ${#PID[@]}; i++))
do
    if [ ! $$ = ${PID[$i]} ]; then
        echo $i ${PID[$i]}
        ppid=${PID[$i]}
        # echo $ppid
        if ! kill $ppid > /dev/null 2>&1; then
        echo "Could not send SIGTERM to process $ppid" >&2
        fi
    fi
done