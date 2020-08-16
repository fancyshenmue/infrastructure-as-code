# Usage

# Table of Contents
- [Usage](#usage)
- [Table of Contents](#table-of-contents)
  - [Install LVM (on MongoDB Node) (Options)](#install-lvm-on-mongodb-node-options)
  - [Create LVM (on MongoDB Node) (Options)](#create-lvm-on-mongodb-node-options)
  - [Mount Volume (on MongoDB Node) (Options)](#mount-volume-on-mongodb-node-options)
  - [Add Zookeeper and Kafka Account (on All MongoDB Node)](#add-zookeeper-and-kafka-account-on-all-mongodb-node)
  - [Install Kafka](#install-kafka)
  - [Configure](#configure)
  - [systemd daemon-reload](#systemd-daemon-reload)
  - [Start Kafka Service](#start-kafka-service)

## Install LVM (on MongoDB Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="kafka_sample"
export _PLAYBOOK="playbook/packages/lvm.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Create LVM (on MongoDB Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="kafka_sample"
export _PLAYBOOK="playbook/filesystem/lvm_filesystem.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Mount Volume (on MongoDB Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="kafka_sample"
export _PLAYBOOK="playbook/config/fstab_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Add Zookeeper and Kafka Account (on All MongoDB Node)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="kafka_sample"
export _PLAYBOOK="playbook/permission/linux_account.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Install Kafka
``` shell
export _INVENTORY="inventory/hosts"
export _HN="kafka_sample"
export _PLAYBOOK="playbook/packages/kafka.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Configure
``` shell
export _INVENTORY="inventory/hosts"
export _HN="kafka_sample"
export _PLAYBOOK="playbook/config/kafka_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## systemd daemon-reload
``` shell
export _INVENTORY="inventory/hosts"
export _HN="kafka_sample"
export _MODULE=systemd
export _SERVICE_PARAM=yes

ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "daemon_reload=${_SERVICE_PARAM}"
```

## Start Kafka Service
``` shell
export _INVENTORY="inventory/hosts"
export _HN="kafka_sample"
export _MODULE=systemd
export _SERVICE=kafka
export _SERVICE_STATE=started
export _SERVICE_ENABLED=yes

ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} state=${_SERVICE_STATE} enabled=${_SERVICE_ENABLED}"
```
