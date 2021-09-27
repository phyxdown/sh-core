listappend() {
    if [[ -z $1 ]]; then
        R="$2"
    else
        R="$1 $2"
    fi
    echo $R
}
