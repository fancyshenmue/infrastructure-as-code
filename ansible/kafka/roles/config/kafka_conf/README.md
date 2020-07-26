# Role Name
## kafka_conf

## Table of contents
- [Role Name](#role-name)
  - [kafka_conf](#kafka_conf)
  - [Table of contents](#table-of-contents)
- [Usage](#usage)
- [Example Inventory](#example-inventory)
- [Example Playbook](#example-playbook)
- [Example Varaibles](#example-varaibles)
  - [group_vars/kafka_sample/kafka_conf_required_directory.yml](#group_varskafka_samplekafka_conf_required_directoryyml)
  - [group_vars/kafka_sample/kafka_conf_required_data_before.yml](#group_varskafka_samplekafka_conf_required_data_beforeyml)
  - [group_vars/kafka_sample/kafka_conf_required_data.yml](#group_varskafka_samplekafka_conf_required_datayml)
  - [group_vars/kafka_sample/kafka_conf.yml](#group_varskafka_samplekafka_confyml)
  - [group_vars/kafka_sample/externalHosts.yml](#group_varskafka_sampleexternalhostsyml)

# Usage
``` shell
export _INVENTORY=</path>/<to>/<inventory>
export _HN=<host_name>
export _PLAYBOOK=<path>/<to>/<playbook>

ansible-playbook -i ${_INVENTORY} -e "hn=${_HN}" ${_PLAYBOOK}
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
      - role: kafka_conf
```

# Example Varaibles
## group_vars/kafka_sample/kafka_conf_required_directory.yml
``` yaml
kafka_conf_required_directory:
- path: /data
  owner: root
  group: root
  mode: "0755"
- path: /data/kafka
  owner: kafka
  group: kafka
  mode: "0755"
- path: /data/kafka/service
  owner: kafka
  group: kafka
  mode: "0755"
- path: /data/kafka/data
  owner: kafka
  group: kafka
  mode: "0755"
- path: /data/kafka/logs
  owner: kafka
  group: kafka
  mode: "0755"
- path: /data/kafka/kafka-logs
  owner: kafka
  group: kafka
  mode: "0755"
- path: /data/kafka/jmx_exporter
  owner: kafka
  group: kafka
  mode: "0755"
```

## group_vars/kafka_sample/kafka_conf_required_data_before.yml
``` yaml
---
kafka_conf_required_data_before_download_local:
- url: https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.13.0/jmx_prometheus_javaagent-0.13.0.jar
  dest: "{{ role_path }}/files/jmx_prometheus_javaagent-0.13.0.jar"
```

## group_vars/kafka_sample/kafka_conf_required_data.yml
``` yaml
---
kafka_conf_required_data:
- src: "{{ role_path }}/files/jmx_prometheus_javaagent-0.13.0.jar"
  dest: "/data/kafka/jmx_exporter/jmx_prometheus_javaagent-0.13.0.jar"
  owner: kafka
  group: kafka
  mode: "0644"
- src: "{{ inventory_dir }}/group_vars/{{ group_names[0] }}/files/kafka/jmx_exporter.yml"
  dest: "/data/kafka/jmx_exporter/jmx_exporter.yml"
  owner: kafka
  group: kafka
  mode: "0644"
```

## group_vars/kafka_sample/kafka_conf.yml
``` yaml
---
kafka_conf:
# zoo.cfg
- src: "{{ template_server_properties }}"
  dest: /data/kafka/service/config/server.properties
  owner: kafka
  group: kafka
  mode: "0644"
  info:
    cluster: "true"
    logDirs: "/data/kafka/kafka-logs"
    # numNetworkThreads: "3"
    # numIoThreads: "8"
    # socketSendBufferBytes: "102400"
    # socketReceiveBufferBytes: "102400"
    # socketRequestMaxBytes: "104857600"
    # numPartitions: "1"
    # numRecoveryThreadsPerDataDir: "1"
    # offsetsTopicReplicationFactor: "1"
    # transactionStateLogReplicationFactor: "1"
    # transactionStateLogMinIsr: "1"
    # logRetentionHours: "168"
    # logSegmentBytes: "1073741824"
    # logRetentionCheckIntervalMs: "300000"
    zookeeperConnect:
      - "kafka-sample-001:2181"
      - "kafka-sample-002:2181"
      - "kafka-sample-003:2181"
    # zookeeperConnectionTimeoutMs: "6000"
    # groupInitialRebalanceDelayMs: "0"
    # autoCreateTopicsEnable: "true"
    # deleteTopicEnable: "true"
    # defaultReplicationFactor: "3"

# myid
- src: "{{ template_myid }}"
  dest: /data/kafka/data/myid
  owner: kafka
  group: kafka
  mode: "0644"

# systemd
- src: "{{ template_kafka_service }}"
  dest: /etc/systemd/system/kafka.service
  owner: root
  group: root
  mode: "0644"
  info:
    user: kafka
    group: kafka
    execstart: /data/kafka/service/bin/kafka-server-start.sh /data/kafka/service/config/server.properties
    execstop: /data/kafka/service/bin/kafka-server-stop.sh
    syslogidentifier: kafka
    limitnofile: 300000
    limitfsize: infinity
    environment:
      javaHome: /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.el7_8.x86_64/jre
      logDir: /data/kafka/logs
      kafkaOpts: "-javaagent:/data/kafka/jmx_exporter/jmx_prometheus_javaagent-0.13.0.jar=6060:/data/kafka/jmx_exporter/jmx_exporter.yml"
      jmxPort: "9999"
```

## group_vars/kafka_sample/externalHosts.yml
``` yaml
externalHosts:
- 10.0.0.11 kafka-sample-001
- 10.0.0.12 kafka-sample-002
- 10.0.0.13 kafka-sample-003
```
