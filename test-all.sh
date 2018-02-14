find ./playbooks -name '*.yml' -depth 1 | xargs -n1  ansible-playbook --syntax-check --list-tasks -i tests/ansible_hosts
