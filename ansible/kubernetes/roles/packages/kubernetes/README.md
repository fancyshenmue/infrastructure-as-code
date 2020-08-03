# Role Name
## kubernetes

# Usage
``` shell
ansible-playbook -e "hn=<hostsname>" <path>/<to>/<playbook>.yml
```

# Example Playbook
``` yaml
- hosts: '{{ hn }}'
  roles:
      - role: kubernetes
```

# Example Inventory
``` ini
[kubernetes-cluster]
xxx.xxx.xxx.xxx ansible_user=xxxx node_roles=master
xxx.xxx.xxx.xxx ansible_user=xxxx
xxx.xxx.xxx.xxx ansible_user=xxxx
```
