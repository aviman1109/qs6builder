PIDS=`ps aux | grep $2 | awk '{print $2}' | xargs`
echo "this pid $$"
echo "ssh pid $1"
read -a PID <<< "${PIDS}"
for ((i=0; i < ${#PID[@]}; i++))
do
    if [ ! ${PID[$i]} = $$ -a ! ${PID[$i]} = $1 ]; then
        echo $i ${PID[$i]}
        ppid=${PID[$i]}
        # echo $ppid
        if ps -p $ppid > /dev/null; then
            if ! kill $ppid > /dev/null 2>&1; then
            echo "Could not send SIGTERM to process $ppid" >&2
            fi
        fi
    fi
done