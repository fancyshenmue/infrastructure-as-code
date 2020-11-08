# Table of contents
- [Table of contents](#table-of-contents)
- [postgres](#postgres)
  - [Install LVM (options)](#install-lvm-options)
  - [Create LVM (options)](#create-lvm-options)
  - [Mount Volumne (options)](#mount-volumne-options)
  - [Install postgres](#install-postgres)
  - [Config postgres](#config-postgres)
  - [Start postgresql-11 service](#start-postgresql-11-service)
- [permission](#permission)
  - [add linux account](#add-linux-account)
- [monitor](#monitor)
  - [Install node_exporter](#install-node_exporter)
  - [Start node_exporter service](#start-node_exporter-service)
- [logs](#logs)
  - [Install td-agent](#install-td-agent)
  - [Config td-agent](#config-td-agent)

# postgres

## Install LVM (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="postgres"
export _PLAYBOOK="playbook/packages/lvm.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Create LVM (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="postgres"
export _PLAYBOOK="playbook/filesystem/lvm_filesystem.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Mount Volumne (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="postgres"
export _PLAYBOOK="playbook/config/fstab_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Install postgres
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="postgres"
export _PLAYBOOK="playbook/packages/postgres.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Config postgres
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="postgres"
export _PLAYBOOK="playbook/config/postgres_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Start postgresql-11 service
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="postgres"
export _MODULE=systemd
export _MODULE_PARAM="name=postgresql-11 state=started"

ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "${_MODULE_PARAM}"
```

# permission
## add linux account
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="postgres"
export _PLAYBOOK="playbook/permission/linux_account.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

# monitor

## Install node_exporter
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="postgres"
export _PLAYBOOK="playbook/packages/node_exporter.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Start node_exporter service
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="postgres"
export _MODULE=systemd
export _MODULE_PARAM="name=node_exporter state=started"

ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "${_MODULE_PARAM}"
```

# logs

## Install td-agent
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="postgres"
export _PLAYBOOK="playbook/packages/td_agent.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Config td-agent
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="postgres"
export _PLAYBOOK="playbook/config/td_agent_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```
