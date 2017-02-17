#/bin/bash
#Usage: ./antispoof.sh <ip1> <ip2>

port1=`openstack port list | grep $1 | awk -F'|' '{print $2}'`
port2=`openstack port list | grep $2 | awk -F'|' '{print $2}'`

neutron port-update $port1 --allowed-address-pairs type=dict list=true ip_address=0.0.0.0/0
neutron port-update $port2 --allowed-address-pairs type=dict list=true ip_address=0.0.0.0/0
