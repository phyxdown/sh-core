httpget() {
    if [ -z $1 ]; then
        info "invalid params - USAGE: httpget \033[4mURL\033[m \033[4m[JSONFIELD]\033[m"
        return 1
    fi
    curl -s $1
}

httpgetwithcookie() {
    curl -s "$1" --cookie "$2"
}

httpgetjsonfield() {
    curl -s $1 | egrep -o "$2\":\"[^\"]*" | awk -F ":\"" '{print $2}'
}
