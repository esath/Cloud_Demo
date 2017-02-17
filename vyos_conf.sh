#!/bin/vbash
source /opt/vyatta/etc/functions/script-template
configure
#
set interfaces ethernet eth1 address '192.168.92.251/24'
set interfaces ethernet eth1 ip ospf 'mtu-ignore'
set interfaces ethernet eth1 ip ospf network 'broadcast'
set interfaces ethernet eth1 mtu '1400'
#
set nat destination rule 100 description 'Forward_incoming_tcp222_to_SSH_Server'
set nat destination rule 100 destination port '222'
set nat destination rule 100 inbound-interface 'eth0'
set nat destination rule 100 protocol 'tcp'
set nat destination rule 100 translation address '192.168.92.202'
set nat destination rule 100 translation port '22'
#
set nat destination rule 101 description 'Forward_incoming_tcp223_to_SSH_Server'
set nat destination rule 101 destination port '223'
set nat destination rule 101 inbound-interface 'eth0'
set nat destination rule 101 protocol 'tcp'
set nat destination rule 101 translation address '192.168.92.203'
set nat destination rule 101 translation port '22'
#
set nat destination rule 102 description "0000000000000000000000000"
set nat destination rule 102 destination port '80'
set nat destination rule 102 inbound-interface 'eth0'
set nat destination rule 102 protocol 'tcp'
set nat destination rule 102 translation address '192.168.92.203'
set nat destination rule 102 translation port '80'
#
set nat destination rule 103 description "0000000000000000000000000"
set nat destination rule 103 destination port '224'
set nat destination rule 103 inbound-interface 'eth0'
set nat destination rule 103 protocol 'tcp'
set nat destination rule 103 translation address '192.168.92.204'
set nat destination rule 103 translation port '22'
#
set nat destination rule 104 description "0000000000000000000000000"
set nat destination rule 104 destination port '225'
set nat destination rule 104 inbound-interface 'eth0'
set nat destination rule 104 protocol 'tcp'
set nat destination rule 104 translation address '192.168.92.204'
set nat destination rule 104 translation port '80'
#
set nat source rule 1 description 'NAT_all_outgoing_Traffic'
set nat source rule 1 destination address '0.0.0.0/0'
set nat source rule 1 outbound-interface 'eth0'
set nat source rule 1 source address '192.168.92.0/24'
set nat source rule 1 translation address 'masquerade'
#
set protocols ospf area 0 network 192.168.92.0/24
#
commit
save
exit
exit


