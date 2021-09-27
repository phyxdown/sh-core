source assert.sh
source logger.sh
source net.sh
source time.sh
source list.sh

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

info "test countdown 3"
countdown 3
info "[pass]"
