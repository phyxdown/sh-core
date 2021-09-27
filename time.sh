countdown() {
    for i in $(seq -w $1) 
    do
        sleep 1
        echo -ne "\rsleep $i/$1s"
    done
}
