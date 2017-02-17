1. Source your Credentials
2. Run heat-template to create router, networks and one vyos for test-server.
   heat stack-create --template-file demo_heat.yml DEMOx
3. Do ansible_run to configure router (change 'vyos1' floating ip to hosts -file first)
   ansible-playbook vyos_conf.yml
4. Check connectivity to router ssh vyos@router-floating-ip
5. Modify and run add_server.yml to add more servers:
   ansible-playbook add_server.yml

#

 hosts			Ansible inventory-file
 ansible.cfg		Ansible config-file
 README.md		This file
#
 demo_heat.yml		HEAT-template to create network, router and sample-server(vyos)
#
 vyos_conf.yml		Ansible-playbook for router-configuration 
 vyos_conf.sh		Router configuration script
#
 add_server.yml		Create 1st basic server
 add_server2.yml	Create 2nd server. Run additional services with conf_server2.yml
 conf_server2.yml	Install services to server2
 ospfd.conf		Quagga-server config-file
 zebra.conf		Another Quagga-server config-file
#
 antispoof.sh		Script to disable antispoof for routers or other. See from file howto use.


DEMO-video:
https://dreambroker.com/channel/dzlgjqqt/xd9t9bz0

GIT:
https://github.com/esath/Cloud_Demo

HEAT_URL:
https://raw.githubusercontent.com/esath/Cloud_Demo/master/demo_heat.yml
