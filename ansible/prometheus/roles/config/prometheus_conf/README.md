# Role Name
## prometheus

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
<hostname> ansible_user=root
```

# Example Playbook
----------------
``` yaml
- hosts: '{{ hn }}'
  roles:
      - role: prometheus
```

# Example Varaibles
## vars/\<env\>/\<type\>/\<groupname\>.yml
``` yaml
---
prometheus_conf_required_directory:
- path: /<directory>/<path>
  owner: <directory_owner>
  group: <directory_group>
  mode: "<directory_mode>"

prometheus_conf_required_data:
- src: <path>/<to>/<src>/<file>
  dest: /<path>/<to>/<dest>/<file>
  owner: <file_owner>
  group: <file_group>
  mode: "<file_mode>"

# config name
prometheus_conf:
- src: <path>/<to>/<src>/<file>
  dest: /<path>/<to>/<dest>/<file>
  owner: <file_owner>
  group: <file_group>
  mode: "<file_mode>"

prometheus_conf_custom:
- src: <path>/<to>/<src>/<file>
  dest: <path>/<to>/<dest>/<file>
  owner: <file_owner>
  group: <file_group>
  mode: "<file_mode>"
```
