# Role Name
## kafka_manager

# Usage
``` shell
export INVENTORY=</path>/<to>/<inventory>
export HN=<host_name>
export PLAYBOOK=<path>/<to>/<playbook>

ansible-playbook -i ${INVENTORY} -e "hn=${HN}" ${PLAYBOOK}
```

# Example Playbook
``` yaml
- hosts: '{{ hn }}'
  roles:
      - role: kafka_manager
```

# Example Inventory
``` ini
[<groupname>]
<hostname> ansible_user=xxxx
<hostname> ansible_user=xxxx
<hostname> ansible_user=xxxx
```
