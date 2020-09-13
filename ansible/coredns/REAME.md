# Table of contents
- [Table of contents](#table-of-contents)
- [Initial](#initial)
  - [Install LVM (options)](#install-lvm-options)
  - [Create LVM (options)](#create-lvm-options)
  - [Mount Volumne (options)](#mount-volumne-options)
  - [Add Permission](#add-permission)
  - [Install CoreDNS](#install-coredns)
  - [Configure CoreDNS](#configure-coredns)
  - [ETCD Key Example](#etcd-key-example)
  - [Reference](#reference)

# Initial

## Install LVM (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="coredns"
export _PLAYBOOK="playbook/packages/lvm.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Create LVM (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="coredns"
export _PLAYBOOK="playbook/filesystem/lvm_filesystem.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Mount Volumne (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="coredns"
export _PLAYBOOK="playbook/config/fstab_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Add Permission
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="coredns"
export _PLAYBOOK="playbook/permission/linux_account.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Install CoreDNS
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="coredns"
export _PLAYBOOK="playbook/packages/coredns.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Configure CoreDNS
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="coredns"
export _PLAYBOOK="playbook/config/coredns_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## ETCD Key Example
``` yaml
A_Record:
  key: /coredns/com/sample/www
  value: {"host":"192.168.88.104","ttl":60}
```

## Reference
[CoreDNS ETCD Plugins](https://coredns.io/plugins/etcd/)
