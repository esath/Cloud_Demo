1. Source your Credentials
2. Run heat-template
   heat stack-create --template-file demo_heat.yml DEMOx
3. Do ansible_run (change ip to hosts -file first)
   ansible-playbook ansible_run.yml -k
4. Check connectivity 
