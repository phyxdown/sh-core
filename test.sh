source assert.sh
source logger.sh
source net.sh
source time.sh
source list.sh
source async.sh

info "[test no params]"
httpget
info "[pass]"

info "[test listappend \"\" A]"
L=`listappend $L "A"`
assertequals "A" "$L"
info "[pass]"

info "[test listappend A B]"
L=A
L=`listappend $L "B"`
assertequals "A B" "$L"
info "[pass]"

info "test async + await"
rm boot.log
future=`async "echo \"server started\" > boot.log" "boot.log" "server started"`
assertequals "boot.log@-SPLIT-@server@-SPACE-@started" "$future"
await "$future"
info "[pass]"

info "test multi(async + await)"
for i in {1..2}
do
    rm "$i.log"
    future=`async "echo 'message $i' > $i.log" "$i.log" "message $i"`
    futures=`listappend "$futures" "$future"`
done
for i in $futures
do
    await "$i"
done
info "[pass]"

info "test countdown 3"
countdown 3
info "[pass]"
