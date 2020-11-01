# Role Name
## fstab

# Usage
``` shell
export _INVENTORY=inventory/hosts
export _HN=filesystem_sample
export _PLAYBOOK=playbook/config/fstab_conf.yml

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

# Example Inventory
``` ini
[<groupname>]
<hostname> ansible_user=root
<hostname> ansible_user=root
<hostname> ansible_user=root
```

# Example Playbook
----------------
``` yaml
- hosts: '{{ hn }}'
  roles:
      - role: fstab
```

# Example Variables
## group_vars/\<group_name\>/fstab_conf_required_directory.yml
``` yaml
---
fstab_conf_required_directory:
  - path: "/data"
    owner: "root"
    group: "root"
    mode: "0755"
```

## group_vars/\<group_name\>/fstab_conf.yml
``` yaml
---
fstab_conf:
- "/dev/mapper/data-data /data xfs defaults 0 0"
```
