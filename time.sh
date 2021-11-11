countdown() {
    for i in $(seq -w $1) 
    do
        sleep 1
        echo -ne "\rsleep $i/$1s"
    done
    echo ""
}

schedule() {
    while true
    do
        eval "$2"
        sleep $1
    done
}
