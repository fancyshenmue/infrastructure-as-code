# Table of contents
- [Table of contents](#table-of-contents)
- [zookeeper](#zookeeper)
  - [Install LVM (options)](#install-lvm-options)
  - [Create LVM (options)](#create-lvm-options)
  - [Mount Volumne (options)](#mount-volumne-options)
  - [Create account](#create-account)
  - [Install zookeeper](#install-zookeeper)
  - [Config zookeeper](#config-zookeeper)
  - [Start zookeeper service](#start-zookeeper-service)
- [kafka](#kafka)
  - [Install LVM (options)](#install-lvm-options-1)
  - [Create LVM (options)](#create-lvm-options-1)
  - [Mount Volumne (options)](#mount-volumne-options-1)
  - [Create account](#create-account-1)
  - [Install kafka](#install-kafka)
  - [Config kafka](#config-kafka)
  - [Start kafka service](#start-kafka-service)

# zookeeper

## Install LVM (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="zookeeper"
export _PLAYBOOK="playbook/packages/lvm.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Create LVM (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="zookeeper"
export _PLAYBOOK="playbook/filesystem/lvm_filesystem.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Mount Volumne (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="zookeeper"
export _PLAYBOOK="playbook/config/fstab_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Create account
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="zookeeper"
export _PLAYBOOK="playbook/permission/linux_account.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Install zookeeper
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="zookeeper"
export _PLAYBOOK="playbook/packages/zookeeper.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Config zookeeper
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="zookeeper"
export _PLAYBOOK="playbook/config/zookeeper_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Start zookeeper service
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="zookeeper"
export _MODULE=systemd
export _MODULE_PARAM="name=zookeeper state=started"

ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "${_MODULE_PARAM}"
```

# kafka

## Install LVM (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="kafka"
export _PLAYBOOK="playbook/packages/lvm.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Create LVM (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="kafka"
export _PLAYBOOK="playbook/filesystem/lvm_filesystem.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Mount Volumne (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="kafka"
export _PLAYBOOK="playbook/config/fstab_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Create account
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="kafka"
export _PLAYBOOK="playbook/permission/linux_account.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Install kafka
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="kafka"
export _PLAYBOOK="playbook/packages/kafka.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Config kafka
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="kafka"
export _PLAYBOOK="playbook/config/kafka_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Start kafka service
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="kafka"
export _MODULE=systemd
export _MODULE_PARAM="name=kafka state=started"

ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "${_MODULE_PARAM}"
```
