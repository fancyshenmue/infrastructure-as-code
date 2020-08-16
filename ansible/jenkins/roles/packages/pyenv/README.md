# Role Name
## pyenv

# Usage
``` shell
export INVENTORY=</path>/<to>/<inventory>
export HN=<host_name>
export PLAYBOOK=<path>/<to>/<playbook>

ansible-playbook -i ${INVENTORY} -e "hn=${HN}" ${PLAYBOOK}

# specific user
export USERNAME=<user_name>
ansible-playbook -i ${INVENTORY} -e "hn=${HN}" -e "username=${USERNAME}" ${PLAYBOOK}
```

# Example Playbook
``` yaml
- hosts: '{{ hn }}'
  roles:
      - role: pyenv
```

# Example Inventory
``` ini
[<groupname>]
<hostname> ansible_user=xxxx
<hostname> ansible_user=xxxx
<hostname> ansible_user=xxxx
```
