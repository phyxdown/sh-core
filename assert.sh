assertequals() {
    if [[ $1 == $2 ]]; then
        return 0
    fi
    error "[ASSERT FAIL] $1 AND $2 NOT SAME"
    exit 1
}
