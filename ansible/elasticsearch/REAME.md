# Table of contents
- [Table of contents](#table-of-contents)
- [elasticsearch](#elasticsearch)
  - [Install LVM (options)](#install-lvm-options)
  - [Create LVM (options)](#create-lvm-options)
  - [Mount Volumne (options)](#mount-volumne-options)
  - [Install elasticsearch](#install-elasticsearch)
  - [Config elasticsearch](#config-elasticsearch)
  - [Start elasticsearch service](#start-elasticsearch-service)
- [kibana](#kibana)
  - [Install kibana](#install-kibana)
  - [Config kibana](#config-kibana)

# elasticsearch

## Install LVM (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="es"
export _PLAYBOOK="playbook/packages/lvm.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Create LVM (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="es"
export _PLAYBOOK="playbook/filesystem/lvm_filesystem.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Mount Volumne (options)
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="es"
export _PLAYBOOK="playbook/config/fstab_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Install elasticsearch
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="es"
export _PLAYBOOK="playbook/packages/elasticsearch.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Config elasticsearch
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="es"
export _PLAYBOOK="playbook/config/elasticsearch_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Start elasticsearch service
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="es"
export _MODULE=systemd
export _MODULE_PARAM="name=elasticsearch state=started"

ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "${_MODULE_PARAM}"
```

# kibana

## Install kibana
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="es-coordinating01.sample.com,es-coordinating02.sample.com"
export _PLAYBOOK="playbook/packages/kibana.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```

## Config kibana
``` shell
export _INVENTORY="inventory/sample/hosts"
export _HN="es-coordinating01.sample.com,es-coordinating02.sample.com"
export _PLAYBOOK="playbook/config/kibana_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK}
```
