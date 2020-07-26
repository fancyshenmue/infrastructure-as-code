# Role Name
## zookeeper_conf

## Table of contents
- [Role Name](#role-name)
  - [zookeeper_conf](#zookeeper_conf)
  - [Table of contents](#table-of-contents)
- [Usage](#usage)
- [Example Inventory](#example-inventory)
- [Example Playbook](#example-playbook)
- [Example Varaibles](#example-varaibles)
  - [group_vars/kafka_sample/zookeeper_conf_required_directory.yml](#group_varskafka_samplezookeeper_conf_required_directoryyml)
  - [group_vars/kafka_sample/zookeeper_conf.yml](#group_varskafka_samplezookeeper_confyml)

# Usage
``` shell
export INVENTORY=</path>/<to>/<inventory>
export HN=<host_name>
export PLAYBOOK=<path>/<to>/<playbook>

ansible-playbook -i ${INVENTORY} -e "hn=${HN}" ${PLAYBOOK}
```

# Example Inventory
``` ini
[<groupname>]
<hostname> ansible_user=root
<hostname> ansible_user=root
```

# Example Playbook
``` yaml
- hosts: '{{ hn }}'
  roles:
      - role: zookeeper_conf
```

# Example Varaibles
## group_vars/kafka_sample/zookeeper_conf_required_directory.yml
``` yaml
---
zookeeper_conf_required_directory:
- path: /data
  owner: root
  group: root
  mode: "0755"
- path: /data/zookeeper
  owner: zookeeper
  group: zookeeper
  mode: "0755"
- path: /data/zookeeper/service
  owner: zookeeper
  group: zookeeper
  mode: "0755"
- path: /data/zookeeper/data
  owner: zookeeper
  group: zookeeper
  mode: "0755"
- path: /data/zookeeper/datalog
  owner: zookeeper
  group: zookeeper
  mode: "0755"
- path: /data/zookeeper/logs
  owner: zookeeper
  group: zookeeper
  mode: "0755"
```

## group_vars/kafka_sample/zookeeper_conf.yml
``` yaml
---
zookeeper_conf:
# zoo.cfg
- src: "{{ template_zoo_cfg }}"
  dest: /data/zookeeper/service/conf/zoo.cfg
  owner: zookeeper
  group: zookeeper
  mode: "0644"
  info:
    dataDir: /data/zookeeper/data
    dataLogDir: /data/zookeeper/datalog
    cluster: "true"

# myid
- src: "{{ template_myid }}"
  dest: /data/zookeeper/data/myid
  owner: zookeeper
  group: zookeeper
  mode: "0644"

# java.env
- src: "{{ template_java_env }}"
  dest: /data/zookeeper/service/conf/java.env
  owner: zookeeper
  group: zookeeper
  mode: "0644"
  info:
    jvmflags: "-Xmx1024m -Xms1024m"

# systemd
- src: "{{ template_zookeeper_service }}"
  dest: /etc/systemd/system/zookeeper.service
  owner: root
  group: root
  mode: "0644"
  info:
    user: zookeeper
    group: zookeeper
    execstart: /data/zookeeper/service/bin/zkServer.sh start
    execstop: /data/zookeeper/service/bin/zkServer.sh stop
    execreload: /data/zookeeper/service/bin/zkServer.sh restart
    workingdirectory: /data/zookeeper/service
    syslogidentifier: zookeeper
    pidfile: /data/zookeeper/data/zookeeper_server.pid
    environment:
      zoo_log_dir: /data/zookeeper/logs
```
