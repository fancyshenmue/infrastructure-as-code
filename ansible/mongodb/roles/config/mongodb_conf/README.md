# Role Name
## mongodb_conf

## Table of contents
- [Role Name](#Role-Name)
  - [Usage Example](#Usage-Example)
    - [initial](#initial)
    - [reboot](#reboot)
    - [enable service](#enable-service)
    - [start config and shard](#start-config-and-shard)
    - [create config and shard replica set](#create-config-and-shard-replica-set)
    - [start router](#start-router)
    - [add shard](#add-shard)
    - [add user](#add-user)
    - [update config](#update-config)
  - [Inventory Example](#Inventory-Example)
  - [Playbook Example](#Playbook-Example)
  - [Varaibles Example](#Varaibles-Example)
    - [group_vars / mongodb_sample / mongodb_conf_required_directory.yml](#group_vars-/-mongodb_sample-/-mongodb_conf_required_directory.yml)
    - [group_vars/mongodb_sample/mongodb_conf_required_data.yml](#group_vars/mongodb_sample/mongodb_conf_required_data.yml)
    - [group_vars/mongodb_sample/mongodb_conf.yml](#group_vars/mongodb_sample/mongodb_conf.yml)
    - [group_vars/mongodb_sample/mongodb_conf_permission_after.yml](#group_vars/mongodb_sample/mongodb_conf_permission_after.yml)
    - [group_vars/mongodb_sample_router/mongodb_conf.yml](#group_vars/mongodb_sample_router/mongodb_conf.yml)
    - [group_vars/mongodb_sample_config/mongodb_conf.yml](#group_vars/mongodb_sample_config/mongodb_conf.yml)
    - [group_vars/mongodb_sample_shard_001/mongodb_conf.yml](#group_vars/mongodb_sample_shard_001/mongodb_conf.yml)
    - [group_vars/mongodb_sample_shard_002/mongodb_conf.yml](#group_vars/mongodb_sample_shard_002/mongodb_conf.yml)
    - [host_vars/mongo-router-001/mongodb_conf_shard.yml](#host_vars/mongo-router-001/mongodb_conf_shard.yml)
    - [host_vars/mongo-shard-001-001/mongodb_conf_replica_set.yml](#host_vars/mongo-shard-001-001/mongodb_conf_replica_set.yml)
    - [host_vars/mongo-shard-002-001/mongodb_conf_replica_set.yml](#host_vars/mongo-shard-002-001/mongodb_conf_replica_set.yml)
    - [host_vars/mongo-router-001/mongodb_conf_mongodb_user.yml](#host_vars/mongo-router-001/mongodb_conf_mongodb_user.yml)
  - [Auth Key Generator Example](#Auth-Key-Generator-Example)

# Usage Example
## initial
``` shell
export _INVENTORY="inventory/sample/common/hosts"
export _HN="mongodb_sample"
export _PLAYBOOK="playbook/config/mongodb_conf.yml"
export _TAGS=initial

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --tags ${_TAGS}
```

## reboot
``` shell
export _INVENTORY="inventory/sample/common/hosts"
export _HN="mongodb_sample"
export _MODULE=reboot
export _SERVICE_PARAM=3600

ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "reboot_timeout=${_SERVICE_PARAM}"
```

## enable service
``` shell
export _INVENTORY="inventory/sample/common/hosts"
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

## start config and shard
``` shell
export _INVENTORY="inventory/sample/common/hosts"
export _MODULE=systemd
export _SERVICE_PARAM=started

export _HN=mongodb_sample_config
export _SERVICE=mongod_config
ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} state=${_SERVICE_PARAM}"

export _HN=mongodb_sample_shard
export _SERVICE=mongod_shard
ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} state=${_SERVICE_PARAM}"
```

## create config and shard replica set
``` shell
export _INVENTORY="inventory/sample/common/hosts"
export _HN="mongodb_sample_config,mongodb_sample_shard"
export _PLAYBOOK="playbook/config/mongodb_conf.yml"
export _TAGS=replica

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --tags ${_TAGS}
```

## start router
``` shell
export _INVENTORY="inventory/sample/common/hosts"
export _MODULE=systemd
export _SERVICE_PARAM=started

export _HN=mongodb_sample_router
export _SERVICE=mongod_router
ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} state=${_SERVICE_PARAM}"
```

## add shard
``` shell
export _INVENTORY="inventory/sample/common/hosts"
export _HN="mongodb_sample_router"
export _PLAYBOOK="playbook/config/mongodb_conf.yml"
export _TAGS=shard

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --tags ${_TAGS}
```

## add user
``` shell
export _INVENTORY="inventory/sample/common/hosts"
export _HN="mongodb_sample_router"
export _PLAYBOOK="playbook/config/mongodb_conf.yml"
export _TAGS=user

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --tags ${_TAGS}
```

## update config
``` shell
export _INVENTORY="inventory/sample/common/hosts"
export _HN="mongodb_sample"
export _PLAYBOOK="playbook/config/mongodb_conf.yml"
export _TAGS=config

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --tags ${_TAGS}
```

# Inventory Example
``` ini
# mongo
[mongodb_sample_router]
mongo-router-001 ansible_user=root ansible_ssh_host=xxx.xxx.xxx.xxx
mongo-router-002 ansible_user=root ansible_ssh_host=xxx.xxx.xxx.xxx
mongo-router-003 ansible_user=root ansible_ssh_host=xxx.xxx.xxx.xxx

[mongodb_sample_config]
mongo-config-001 ansible_user=root ansible_ssh_host=xxx.xxx.xxx.xxx
mongo-config-002 ansible_user=root ansible_ssh_host=xxx.xxx.xxx.xxx
mongo-config-003 ansible_user=root ansible_ssh_host=xxx.xxx.xxx.xxx

[mongodb_sample_shard_001]
mongo-shard-001-001 ansible_user=root ansible_ssh_host=xxx.xxx.xxx.xxx
mongo-shard-001-002 ansible_user=root ansible_ssh_host=xxx.xxx.xxx.xxx
mongo-shard-001-003 ansible_user=root ansible_ssh_host=xxx.xxx.xxx.xxx

[mongodb_sample_shard_002]
mongo-shard-002-001 ansible_user=root ansible_ssh_host=xxx.xxx.xxx.xxx
mongo-shard-002-002 ansible_user=root ansible_ssh_host=xxx.xxx.xxx.xxx
mongo-shard-002-003 ansible_user=root ansible_ssh_host=xxx.xxx.xxx.xxx

[mongodb_sample_shard:children]
mongodb_sample_shard_001
mongodb_sample_shard_002

[mongodb_sample:children]
mongodb_sample_router
mongodb_sample_config
mongodb_sample_shard
# end of mongo
```

# Playbook Example
----------------
``` yaml
- hosts: '{{ hn }}'
  roles:
      - role: mongodb_conf
```

# Varaibles Example
## group_vars / mongodb_sample / mongodb_conf_required_directory.yml
``` yaml
mongodb_conf_required_directory:
- path: /data
  owner: root
  group: root
  mode: "0755"
- path: /data/mongodb/log
  owner: mongod
  group: mongod
  mode: "0755"
- path: /data/mongodb/data
  owner: mongod
  group: mongod
  mode: "0755"
- path: /data/mongodb/pid
  owner: mongod
  group: mongod
  mode: "0755"
- path: /data/mongodb/conf
  owner: mongod
  group: mongod
  mode: "0755"
- path: /data/mongodb/auth
  owner: mongod
  group: mongod
  mode: "0755"
```

## group_vars/mongodb_sample/mongodb_conf_required_data.yml
``` yaml
---
mongodb_conf_required_data:
- src: <path>/<to>/<src>/<file>
  dest: /<path>/<to>/<dest>/<file>
  owner: <file_owner>
  group: <file_group>
  mode: "<file_mode>"
```

## group_vars/mongodb_sample/mongodb_conf.yml
``` yaml
---
mongodb_conf_append:
- dest: /etc/rc.d/rc.local
  marker: "# {mark} Ansible Mongo Management"
  content: rc.local.j2
  info:
    append:
      - echo never > /sys/kernel/mm/transparent_hugepage/enabled
      - echo never > /sys/kernel/mm/transparent_hugepage/defrag
```

## group_vars/mongodb_sample/mongodb_conf_permission_after.yml
``` yaml
---
mongodb_conf_permission_after:
- path: /etc/rc.d/rc.local
  owner: root
  group: root
  mode: "0755"
```

## group_vars/mongodb_sample_router/mongodb_conf.yml
``` yaml
---
mongodb_conf:
# config
- src: mongod.conf.j2
  dest: /data/mongodb/conf/mongod.conf
  owner: root
  group: root
  mode: "0644"
  info:
    mongoRoles: "router"
    systemLog:
      - "  destination: file"
      - "  logAppend: true"
      - "  path: /data/mongodb/log/mongod.log"
    processManagement:
      - "  fork: true"
      - "  pidFilePath: /data/mongodb/pid/mongod.pid"
      - "  timeZoneInfo: /usr/share/zoneinfo"
    net:
      - "  port: 27017"
      - "  bindIp: 0.0.0.0"
    # security:
    #   - "  clusterAuthMode: keyFile"
    #   - "  keyFile: /data/mongodb/auth/mongod.key"
    sharding:
      - "  configDB: ConfigDBRepSet/{% for i in groups['mongodb_sample_config'] %}{{ i }}:27017{% if not loop.last %},{% endif %}{% endfor %}"

# service
- src: mongod.service.j2
  dest: /etc/systemd/system/mongod_router.service
  owner: root
  group: root
  mode: "0644"
  info:
    Unit:
      After: network.target rc-local.service
    Service:
      Environment:
        OPTIONS: OPTIONS=-f /data/mongodb/conf/mongod.conf
      ExecStart: /usr/bin/mongos $OPTIONS
      ExecStartPre:
        - "/usr/bin/mkdir -p /data/mongodb/pid"
        - "/usr/bin/chown mongod:mongod /data/mongodb/pid"
        - "/usr/bin/chmod 0755 /data/mongodb/pid"
      PIDFile: /data/mongodb/pid/mongod.pid
```

## group_vars/mongodb_sample_config/mongodb_conf.yml
``` yaml
---
mongodb_conf:
# config
- src: mongod.conf.j2
  dest: /data/mongodb/conf/mongod.conf
  owner: root
  group: root
  mode: "0644"
  info:
    systemLog:
      - "  destination: file"
      - "  logAppend: true"
      - "  path: /data/mongodb/log/mongod.log"
    storage:
      - "  dbPath: /data/mongodb/data"
      - "  journal:"
      - "    enabled: true"
      - "  wiredTiger:"
      - "    engineConfig:"
      - "      cacheSizeGB: 5"
    processManagement:
      - "  fork: true"
      - "  pidFilePath: /data/mongodb/pid/mongod.pid"
      - "  timeZoneInfo: /usr/share/zoneinfo"
    net:
      - "  port: 27017"
      - "  bindIp: 0.0.0.0"
    # security:
    #   - "  authorization: enabled"
    #   - "  clusterAuthMode: keyFile"
    #   - "  keyFile: /data/mongodb/auth/mongod.key"
    replication:
      - "  replSetName: ConfigDBRepSet"
    sharding:
      - "  clusterRole: configsvr"

# service
- src: mongod.service.j2
  dest: /etc/systemd/system/mongod_config.service
  owner: root
  group: root
  mode: "0644"
  info:
    Unit:
      After: network.target rc-local.service
    Service:
      Environment:
        OPTIONS: OPTIONS=-f /data/mongodb/conf/mongod.conf
      ExecStart: /usr/bin/mongod $OPTIONS
      ExecStartPre:
        - "/usr/bin/mkdir -p /data/mongodb/pid"
        - "/usr/bin/chown mongod:mongod /data/mongodb/pid"
        - "/usr/bin/chmod 0755 /data/mongodb/pid"
      PIDFile: /data/mongodb/pid/mongod.pid
```

## group_vars/mongodb_sample_shard_001/mongodb_conf.yml
``` yaml
---
mongodb_conf:
# config
- src: mongod.conf.j2
  dest: /data/mongodb/conf/mongod.conf
  owner: root
  group: root
  mode: "0644"
  info:
    systemLog:
      - "  destination: file"
      - "  logAppend: true"
      - "  path: /data/mongodb/log/mongod.log"
    storage:
      - "  dbPath: /data/mongodb/data"
      - "  journal:"
      - "    enabled: true"
      - "  wiredTiger:"
      - "    engineConfig:"
      - "      cacheSizeGB: 5"
    processManagement:
      - "  fork: true"
      - "  pidFilePath: /data/mongodb/pid/mongod.pid"
      - "  timeZoneInfo: /usr/share/zoneinfo"
    net:
      - "  port: 27017"
      - "  bindIp: 0.0.0.0"
    # security:
    #   - "  authorization: enabled"
    #   - "  clusterAuthMode: keyFile"
    #   - "  keyFile: /data/mongodb/auth/mongod.key"
    replication:
      - "  replSetName: Shard1RepSet"
    sharding:
      - "  clusterRole: shardsvr"

# service
- src: mongod.service.j2
  dest: /etc/systemd/system/mongod_shard.service
  owner: root
  group: root
  mode: "0644"
  info:
    Unit:
      After: network.target rc-local.service
    Service:
      Environment:
        OPTIONS: OPTIONS=-f /data/mongodb/conf/mongod.conf
      ExecStart: /usr/bin/mongod $OPTIONS
      ExecStartPre:
        - "/usr/bin/mkdir -p /data/mongodb/pid"
        - "/usr/bin/chown mongod:mongod /data/mongodb/pid"
        - "/usr/bin/chmod 0755 /data/mongodb/pid"
      PIDFile: /data/mongodb/pid/mongod.pid
```

## group_vars/mongodb_sample_shard_002/mongodb_conf.yml
``` yaml
---
mongodb_conf:
# config
- src: mongod.conf.j2
  dest: /data/mongodb/conf/mongod.conf
  owner: root
  group: root
  mode: "0644"
  info:
    systemLog:
      - "  destination: file"
      - "  logAppend: true"
      - "  path: /data/mongodb/log/mongod.log"
    storage:
      - "  dbPath: /data/mongodb/data"
      - "  journal:"
      - "    enabled: true"
      - "  wiredTiger:"
      - "    engineConfig:"
      - "      cacheSizeGB: 5"
    processManagement:
      - "  fork: true"
      - "  pidFilePath: /data/mongodb/pid/mongod.pid"
      - "  timeZoneInfo: /usr/share/zoneinfo"
    net:
      - "  port: 27017"
      - "  bindIp: 0.0.0.0"
    # security:
    #   - "  authorization: enabled"
    #   - "  clusterAuthMode: keyFile"
    #   - "  keyFile: /data/mongodb/auth/mongod.key"
    replication:
      - "  replSetName: Shard2RepSet"
    sharding:
      - "  clusterRole: shardsvr"

# service
- src: mongod.service.j2
  dest: /etc/systemd/system/mongod_shard.service
  owner: root
  group: root
  mode: "0644"
  info:
    Unit:
      After: network.target rc-local.service
    Service:
      Environment:
        OPTIONS: OPTIONS=-f /data/mongodb/conf/mongod.conf
      ExecStart: /usr/bin/mongod $OPTIONS
      ExecStartPre:
        - "/usr/bin/mkdir -p /data/mongodb/pid"
        - "/usr/bin/chown mongod:mongod /data/mongodb/pid"
        - "/usr/bin/chmod 0755 /data/mongodb/pid"
      PIDFile: /data/mongodb/pid/mongod.pid
```

## host_vars/mongo-router-001/mongodb_conf_shard.yml
``` yaml
---
mongodb_conf_shard:
- login_host: "{{ inventory_hostname }}"
  # login_port: "27017"
  # login_user: ""
  # login_password: ""
  shard: "Shard1RepSet/mongo-shard-001-001:27017,mongo-shard-001-002:27017,mongo-shard-001-003:27017"
  state: "present"

- login_host: "{{ inventory_hostname }}"
  # login_port: "27017"
  # login_user: ""
  # login_password: ""
  shard: "Shard2RepSet/mongo-shard-002-001:27017,mongo-shard-002-002:27017,mongo-shard-002-003:27017"
  state: "present"
```

## host_vars/mongo-config-001/mongodb_conf_replica_set.yml
``` yaml
---
mongodb_conf_replica_set:
- login_host: "{{ inventory_hostname }}"
  # login_port: "27017"
  # login_user: ""
  # login_password: ""
  replica_set: "ConfigDBRepSet"
  members:
    - mongo-config-001:27017
    - mongo-config-002:27017
    - mongo-config-003:27017
```

## host_vars/mongo-shard-001-001/mongodb_conf_replica_set.yml
``` yaml
---
mongodb_conf_replica_set:
- login_host: "{{ inventory_hostname }}"
  # login_port: "27017"
  # login_user: ""
  # login_password: ""
  replica_set: "Shard1RepSet"
  members:
    - mongo-shard-001-001:27017
    - mongo-shard-001-002:27017
    - mongo-shard-001-003:27017
```

## host_vars/mongo-shard-002-001/mongodb_conf_replica_set.yml
``` yaml
---
mongodb_conf_replica_set:
- login_host: "{{ inventory_hostname }}"
  # login_port: "27017"
  # login_user: ""
  # login_password: ""
  replica_set: "Shard2RepSet"
  members:
    - mongo-shard-002-001:27017
    - mongo-shard-002-002:27017
    - mongo-shard-002-003:27017
```

## host_vars/mongo-router-001/mongodb_conf_mongodb_user.yml
``` yaml
---
mongodb_conf_mongodb_user:
- login_host: "{{ inventory_hostname }}"
  # login_port: "27017"
  # login_user: ""
  # login_password: ""
  database: admin
  user: root
  password: example
  roles: root
```

# Auth Key Generator Example
``` shell
openssl rand -base64 756 > group_vars/mongodb_sample/files/mongod.key
```
