# Table of contents
- [Table of contents](#table-of-contents)
- [consul](#consul)
  - [Install LVM (options)](#install-lvm-options)
  - [Create LVM (options)](#create-lvm-options)
  - [Mount Volumne (options)](#mount-volumne-options)
  - [Add Permission](#add-permission)
  - [Install consul](#install-consul)
  - [Generator Consul Keygen](#generator-consul-keygen)
    - [write keygen to group_vars/\<group_name\>/consul_conf.yml](#write-keygen-to-group_varsgroup_nameconsul_confyml)
  - [Config Consul](#config-consul)
  - [Start Consul Service](#start-consul-service)
- [consul-template](#consul-template)
  - [Add Permission](#add-permission-1)
  - [Install consul-template](#install-consul-template)
  - [Config consul-template](#config-consul-template)
- [vault](#vault)
  - [Add Permission](#add-permission-2)
  - [Install vault](#install-vault)
  - [Config vault](#config-vault)

# consul

## Install LVM (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="consul"
export _PLAYBOOK="playbook/packages/lvm.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Create LVM (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="consul"
export _PLAYBOOK="playbook/filesystem/lvm_filesystem.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Mount Volumne (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="consul"
export _PLAYBOOK="playbook/config/fstab_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Add Permission
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="consul"
export _PLAYBOOK="playbook/permission/linux_account.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Install consul
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="consul"
export _PLAYBOOK="playbook/packages/consul.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Generator Consul Keygen
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="consul01.sample.com"
export _MODULE=shell
export _MODULE_PARAM="/data/consul/consul keygen"

ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "${_MODULE_PARAM}"
```
### write keygen to group_vars/\<group_name\>/consul_conf.yml
``` yaml
consul_conf:
# config
- src: config.json.j2
  dest: /data/consul/consul.d/config.json
  owner: consul
  group: consul
  mode: "0644"
  info:
    datacenter: DC1
    data_dir: /data/consul/data
    domain: consul.sample.com
    encrypt: <keygen> # write here
```

## Config Consul
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="consul"
export _PLAYBOOK="playbook/config/consul_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Start Consul Service
``` shell
export _INVENTORY="inventory/sample/hosts"
export _MODULE=systemd
export _MODULE_PARAM="name=consul state=started"

export _HN="consul01.sample.com"
ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "${_MODULE_PARAM}"

export _HN="consul02.sample.com,consul03.sample.com"
ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "${_MODULE_PARAM}"
```

# consul-template

## Add Permission
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="consul_template"
export _PLAYBOOK="playbook/permission/linux_account.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Install consul-template
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="consul_template"
export _PLAYBOOK="playbook/packages/consul_template.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Config consul-template
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="consul_template"
export _PLAYBOOK="playbook/config/consul_template_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

# vault

## Add Permission
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="consul_vault"
export _PLAYBOOK="playbook/permission/linux_account.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Install vault
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="consul_vault"
export _PLAYBOOK="playbook/packages/vault.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Config vault
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="consul_vault"
export _PLAYBOOK="playbook/config/vault_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```
