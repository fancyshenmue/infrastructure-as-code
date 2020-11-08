# Role Name
## postgresql_permission

# Usage
``` shell
export INVENTORY=</path>/<to>/<inventory>
export HN=<host_name>
export PLAYBOOK=<path>/<to>/<playbook>

ansible-playbook -i ${INVENTORY} -e "hn=${HN}" ${PLAYBOOK} --ask-vault-pass
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
      - role: postgresql_permission
```

# Generate MD5 Password
## MacOS
``` shell
echo -n "md5" ; md5 -qs "<password><username>"
```

## Linux
``` shell
echo -n "md5" ; echo -n "<password><username>" | md5sum | awk '{ print $1 }'
```
