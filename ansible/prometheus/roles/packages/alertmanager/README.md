# Role Name
## alertmanager

# Usage
``` shell
export _INVENTORY=</path>/<to>/<inventory>
export _HN=<host_name>
export _PLAYBOOK=<path>/<to>/<playbook>

ansible-playbook -i ${_INVENTORY} -e "hn=${_HN}" ${_PLAYBOOK}
```

# Example Playbook
``` yaml
- hosts: '{{ hn }}'
  roles:
      - role: alertmanager
```

# Example Inventory
``` ini
[<groupname>]
<hostname> ansible_user=xxxx
```
