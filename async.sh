async() {
    eval "nohup $1 2>&1 &"
    message=`echo "$3" | sed 's/ /@-SPACE-@/g'`
    echo "$2@-SPLIT-@$message"
}

await() {
    file=`echo ${1%@-SPLIT-@*}`
    message=`echo ${1#*@-SPLIT-@}`
    message=`echo "$message" | sed 's/@-SPACE-@/ /g'`
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
