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
  - [Initial Vault](#initial-vault)
    - [operator init (on one vault node)](#operator-init-on-one-vault-node)
    - [output](#output)
    - [unseal (repeat three times with different unseal key on all vault node)](#unseal-repeat-three-times-with-different-unseal-key-on-all-vault-node)
    - [output (first unseal)](#output-first-unseal)
    - [output (unseal three times)](#output-unseal-three-times)
      - [active node](#active-node)
      - [standby node](#standby-node)
  - [Status](#status)

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

## Initial Vault
### operator init (on one vault node)
``` shell
export VAULT_ADDR=http://127.0.0.1:8200
export _VAULT_BIN=/data/vault/vault

${_VAULT_BIN} operator init
```
### output
``` shell
Unseal Key 1: mK3KawqyUfzaxF+cvH7PjvUQENhWSawvydi9aZpcJZpO
Unseal Key 2: Ptzj1SuPwY/kMl2soujwnelBiMP6oizAMDkEN9O/5EKd
Unseal Key 3: 4BTEyTEU+ffDQMKZzTIuZcbZfH0jKEk8nN04RDiTI4z9
Unseal Key 4: zi8m4wlzya6PKV8fFdl//OtIPrmascpBnfcKAlwdx3MM
Unseal Key 5: 264hCHpfTC4N/dURRjht9RyFsW0tUq647q3A022Z+qyC

Initial Root Token: s.NiJ2kO6H49ckdNBsMiXyo7uR

Vault initialized with 5 key shares and a key threshold of 3. Please securely
distribute the key shares printed above. When the Vault is re-sealed,
restarted, or stopped, you must supply at least 3 of these keys to unseal it
before it can start servicing requests.

Vault does not store the generated master key. Without at least 3 key to
reconstruct the master key, Vault will remain permanently sealed!

It is possible to generate new unseal keys, provided you have a quorum of
existing unseal keys shares. See "vault operator rekey" for more information.
```

### unseal (repeat three times with different unseal key on all vault node)
``` shell
export VAULT_ADDR=http://127.0.0.1:8200
export _VAULT_BIN=/data/vault/vault
export _UNSEAL_KEY="mK3KawqyUfzaxF+cvH7PjvUQENhWSawvydi9aZpcJZpO"

${_VAULT_BIN} operator unseal ${_UNSEAL_KEY}
```

### output (first unseal)
``` shell
Key                Value
---                -----
Seal Type          shamir
Initialized        true
Sealed             true
Total Shares       5
Threshold          3
Unseal Progress    1/3
Unseal Nonce       644e7e64-5218-f738-89a2-f26397c2af0a
Version            1.5.4
HA Enabled         true
```

### output (unseal three times)
#### active node
``` shell
Key                    Value
---                    -----
Seal Type              shamir
Initialized            true
Sealed                 false
Total Shares           5
Threshold              3
Version                1.5.4
Cluster Name           vault-cluster-5f9488de
Cluster ID             4175d4b0-58d4-f60d-1488-9860f2d53e9b
HA Enabled             true
HA Cluster             http://10.0.0.11:8201
HA Mode                active
```

#### standby node
``` shell
Key                    Value
---                    -----
Seal Type              shamir
Initialized            true
Sealed                 false
Total Shares           5
Threshold              3
Version                1.5.4
Cluster Name           vault-cluster-5f9488de
Cluster ID             4175d4b0-58d4-f60d-1488-9860f2d53e9b
HA Enabled             true
HA Cluster             http://10.0.0.11:8201
HA Mode                standby
Active Node Address    http://10.0.0.11:8200
```

## Status
``` shell
export VAULT_ADDR=http://127.0.0.1:8200
export _VAULT_BIN=/data/vault/vault

${_VAULT_BIN} status
```
