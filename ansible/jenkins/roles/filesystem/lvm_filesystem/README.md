# Roles Name
## lvm

# Example Playbook
``` yaml
---
- hosts: '{{ hn }}'
  roles:
    - role: lvm
      become: True
      become_user: root
      become_method: sudo
```

# Usage
``` shell
export _INVENTORY=inventory/hosts
export _HN=filesystem_sample
export _PLAYBOOK=playbook/filesystem/lvm_filesystem.yml

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

# Example Variables
## group_vars/\<group_name\>/lvm_filesystem.yml
``` yaml
---
lvm_filesystem:
- vg: "data"
  lv: "data"
  size: "100%FREE"
  pvs: "/dev/sdb"
  pesize: "4"
  shrink: no
  force: no
  fstype: xfs
  dev: /dev/data/data
```
