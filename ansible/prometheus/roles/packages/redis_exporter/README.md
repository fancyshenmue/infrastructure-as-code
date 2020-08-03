# Role Name
## redis_exporter

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
      - role: redis_exporter
```

# Example Inventory
``` ini
[<groupname>]
<hostname> ansible_user=xxxx
```
