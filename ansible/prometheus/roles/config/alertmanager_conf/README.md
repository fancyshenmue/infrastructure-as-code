# Role Name
## alertmanager_conf

# Usage
``` shell
export INVENTORY=</path>/<to>/<inventory>
export HN=<host_name>
export PLAYBOOK=<path>/<to>/<playbook>

ansible-playbook -i ${INVENTORY} -e "hn=${HN}" ${PLAYBOOK}
```

# Example Inventory
``` ini
[<groupname>]
<hostname> ansible_user=root
```

# Example Playbook
----------------
``` yaml
- hosts: '{{ hn }}'
  roles:
      - role: alertmanager_conf
```

# Example Varaibles
## vars/\<env\>/\<type\>/\<groupname\>.yml
``` yaml
---
alertmanager_conf_required_directory:
- path: /<directory>/<path>
  owner: <directory_owner>
  group: <directory_group>
  mode: "<directory_mode>"

alertmanager_conf_required_data:
- src: <path>/<to>/<src>/<file>
  dest: /<path>/<to>/<dest>/<file>
  owner: <file_owner>
  group: <file_group>
  mode: "<file_mode>"

# config name
alertmanager_conf:
- src: <path>/<to>/<src>/<file>
  dest: /<path>/<to>/<dest>/<file>
  owner: <file_owner>
  group: <file_group>
  mode: "<file_mode>"

alertmanager_conf_custom:
- src: <path>/<to>/<src>/<file>
  dest: <path>/<to>/<dest>/<file>
  owner: <file_owner>
  group: <file_group>
  mode: "<file_mode>"
```
