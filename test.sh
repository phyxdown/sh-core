source assert.sh
source logger.sh
source net.sh
source time.sh

info "[test no params]"
httpget
info "[pass]"

info "test countdown 3"
countdown 3
info "[pass]"
