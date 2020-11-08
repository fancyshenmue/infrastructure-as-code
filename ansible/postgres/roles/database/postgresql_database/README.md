# Role Name
## postgresql_database

# Usage
``` shell
export _INVENTORY=</path>/<to>/<inventory>
export _HN=<host_name>
export _PLAYBOOK=<path>/<to>/<playbook>

ansible-playbook -i ${_INVENTORY} -e "hn=${_HN}" ${_PLAYBOOK} --ask-vault-pass
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
      - role: postgresql_database
```

## Disable Database Connection
``` sql
UPDATE pg_database SET datallowconn = 'false' WHERE datname = '<db_name>';
```

## Check Database Disable Allow Connection
``` sql
SELECT * FROM pg_database WHERE datname = '<db_name>';
```

## Teminate Current Database Connection
``` sql
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = '<db_name>';
```
