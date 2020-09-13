# Table of Contents
- [Table of Contents](#table-of-contents)
- [Initial](#initial)
  - [Install LVM (options)](#install-lvm-options)
  - [Create LVM (options)](#create-lvm-options)
  - [Mount Volumne (options)](#mount-volumne-options)
  - [Install ETCD](#install-etcd)
  - [Install GVM](#install-gvm)
  - [Install Golang](#install-golang)
  - [Install CFSSL](#install-cfssl)
  - [Configure ETCD](#configure-etcd)

# Initial

## Install LVM (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="etcd"
export _PLAYBOOK="playbook/packages/lvm.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Create LVM (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="etcd"
export _PLAYBOOK="playbook/filesystem/lvm_filesystem.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Mount Volumne (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="etcd"
export _PLAYBOOK="playbook/config/fstab_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Install ETCD
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="etcd"
export _PLAYBOOK="playbook/packages/etcd.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Install GVM
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="etcd"
export _PLAYBOOK="playbook/packages/gvm.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Install Golang
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="etcd"
export _PLAYBOOK="playbook/packages/golang.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Install CFSSL
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="etcd"
export _PLAYBOOK="playbook/packages/cfssl.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Configure ETCD
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="etcd"
export _PLAYBOOK="playbook/config/etcd_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
