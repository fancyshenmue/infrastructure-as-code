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
export _PLAYBOOK=playbook/packages/lvm.yml

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```
