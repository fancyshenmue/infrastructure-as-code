# Usage

## Table of contents
- [Usage](#usage)
  - [Table of contents](#table-of-contents)
  - [Install LVM (on MongoDB Node) (Options)](#install-lvm-on-mongodb-node-options)
  - [Create LVM (on MongoDB Node) (Options)](#create-lvm-on-mongodb-node-options)
  - [Mount Volume (on MongoDB Node) (Options)](#mount-volume-on-mongodb-node-options)
  - [Install MongoDB](#install-mongodb)
  - [Initail MongoDB Configure](#initail-mongodb-configure)
  - [Disable Original MongoDB Systemd](#disable-original-mongodb-systemd)
  - [Reboot](#reboot)
  - [Enable Service](#enable-service)
  - [Start Config Node and Shard Node Mongo Service](#start-config-node-and-shard-node-mongo-service)
  - [Create Config Node and Shard Node Replica Set](#create-config-node-and-shard-node-replica-set)
  - [Start Router Node Service](#start-router-node-service)
  - [Add Shard On Router Node](#add-shard-on-router-node)
  - [Add MongoDB Admin User](#add-mongodb-admin-user)
  - [Update Config (Enable Auth)](#update-config-enable-auth)
  - [Restart Service (Enable Auth)](#restart-service-enable-auth)

## Install LVM (on MongoDB Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="mongodb_sample"
export _PLAYBOOK="playbook/packages/lvm.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Create LVM (on MongoDB Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="mongodb_sample"
export _PLAYBOOK="playbook/filesystem/lvm_filesystem.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Mount Volume (on MongoDB Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="mongodb_sample"
export _PLAYBOOK="playbook/config/fstab_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Install MongoDB
``` shell
export _INVENTORY="inventory/hosts"
export _HN="mongodb_sample"
export _PLAYBOOK="playbook/packages/mongodb.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Initail MongoDB Configure
``` shell
export _INVENTORY="inventory/hosts"
export _HN="mongodb_sample"
export _PLAYBOOK="playbook/config/mongodb_conf.yml"
export _TAGS=initial

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --tags ${_TAGS} --ask-vault-pass
```

## Disable Original MongoDB Systemd
``` shell
export _INVENTORY="inventory/hosts"
export _HN="mongodb_sample"
export _MODULE=systemd
export _SERVICE=mongod
export _SERVICE_PARAM=no

ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} enabled=${_SERVICE_PARAM}"
```

## Reboot
``` shell
export _INVENTORY="inventory/hosts"
export _HN="mongodb_sample"
export _MODULE=reboot
export _SERVICE_PARAM=3600

ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "reboot_timeout=${_SERVICE_PARAM}"
```

## Enable Service
``` shell
export _INVENTORY="inventory/hosts"
export _MODULE=systemd
export _SERVICE_PARAM=yes

export _HN=mongodb_sample_router
export _SERVICE=mongod_router
ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} enabled=${_SERVICE_PARAM}"

export _HN=mongodb_sample_config
export _SERVICE=mongod_config
ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} enabled=${_SERVICE_PARAM}"

export _HN=mongodb_sample_shard
export _SERVICE=mongod_shard
ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} enabled=${_SERVICE_PARAM}"
```

## Start Config Node and Shard Node Mongo Service
``` shell
export _INVENTORY="inventory/hosts"
export _MODULE=systemd
export _SERVICE_PARAM=started

export _HN=mongodb_sample_config
export _SERVICE=mongod_config
ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} state=${_SERVICE_PARAM}"

export _HN=mongodb_sample_shard
export _SERVICE=mongod_shard
ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} state=${_SERVICE_PARAM}"
```

## Create Config Node and Shard Node Replica Set
``` shell
export _INVENTORY="inventory/hosts"
export _HN="mongodb_sample_config,mongodb_sample_shard"
export _PLAYBOOK="playbook/config/mongodb_conf.yml"
export _TAGS=replica

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --tags ${_TAGS}
```

## Start Router Node Service
``` shell
export _INVENTORY="inventory/hosts"
export _MODULE=systemd
export _SERVICE_PARAM=started

export _HN=mongodb_sample_router
export _SERVICE=mongod_router
ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} state=${_SERVICE_PARAM}"
```

## Add Shard On Router Node
``` shell
export _INVENTORY="inventory/hosts"
export _HN="mongodb_sample_router"
export _PLAYBOOK="playbook/config/mongodb_conf.yml"
export _TAGS=shard

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --tags ${_TAGS}
```

## Add MongoDB Admin User
``` shell
export _USERNAME=root
export _DATABASE=admin
export _MONGO_URI=mongodb://xxx.xxx.xxx.xxx:27017/admin

mongo --authenticationDatabase ${_DATABASE} ${_MONGO_URI}
```
``` sql
mongos> use admin
switched to db admin
mongos> db.createUser(
...       {
...           user: "root",
...           pwd: "example",
...           roles: [ "root" ]
...       }
...   )
Successfully added user: { "user" : "root", "roles" : [ "root" ] }
```

## Update Config (Enable Auth)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="mongodb_sample"
export _PLAYBOOK="playbook/config/mongodb_conf.yml"
export _TAGS=config

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --tags ${_TAGS} --ask-vault-pass
```

## Restart Service (Enable Auth)
``` shell
export _INVENTORY="inventory/hosts"
export _MODULE=systemd
export _SERVICE_PARAM=restarted

export _HN=mongodb_sample_config
export _SERVICE=mongod_config
ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} state=${_SERVICE_PARAM}"

export _HN=mongodb_sample_shard
export _SERVICE=mongod_shard
ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} state=${_SERVICE_PARAM}"

export _HN=mongodb_sample_router
export _SERVICE=mongod_router
ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} state=${_SERVICE_PARAM}"
```
