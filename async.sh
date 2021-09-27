async() {
    eval "nohup $1 2>&1 &"
    echo "$2@-SPLIT-@$3"
}

await() {
    file=`echo ${1%@-SPLIT-@*}`
    message=`echo ${1#*@-SPLIT-@}`
    DONE=0
    while [ $DONE -eq 0 ]
    do
        if [ -z "`cat $file | grep \"$message\"`" ]
        then
            sleep 1
        else
            DONE=1
        fi
    done
}
