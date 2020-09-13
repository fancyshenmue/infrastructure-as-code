# Role Name
## etcd_conf

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
----------------
``` yaml
- hosts: '{{ hn }}'
  roles:
      - role: etcd_conf
```

# Example Varaibles
## vars/\<env\>/\<type\>/\<groupname\>.yml
``` yaml
---
required_directory:
- path: /<directory>/<path>
  owner: <directory_owner>
  group: <directory_group>
  mode: "<directory_mode>"

required_data:
- src: <path>/<to>/<src>/<file>
  dest: /<path>/<to>/<dest>/<file>
  owner: <file_owner>
  group: <file_group>
  mode: "<file_mode>"

# etcd.conf
etcd_conf:
# etcd.conf
- src: "{{ template_etcd_conf_conf }}"
  dest: "/etc/etcd/etcd.conf"
  owner: root
  group: root
  mode: "0644"
  info:
    # member
    member:
    # - ETCD_CORS=""
    - ETCD_DATA_DIR="/var/lib/etcd/default.etcd"
    # - ETCD_WAL_DIR=""
    - ETCD_LISTEN_PEER_URLS="http://{{ inventory_hostname }}:2380"
    - ETCD_LISTEN_CLIENT_URLS="http://{{ inventory_hostname }}:2379,http://127.0.0.1:2379"
    # - ETCD_MAX_SNAPSHOTS="5"
    # - ETCD_MAX_WALS="5"
    - ETCD_NAME="etcd{{ groups[group_names[0]].index(inventory_hostname) + 1 }}"
    # - ETCD_SNAPSHOT_COUNT="100000"
    # - ETCD_HEARTBEAT_INTERVAL="100"
    # - ETCD_ELECTION_TIMEOUT="1000"
    # - ETCD_QUOTA_BACKEND_BYTES="0"
    # - ETCD_MAX_REQUEST_BYTES="1572864"
    # - ETCD_GRPC_KEEPALIVE_MIN_TIME="5s"
    # - ETCD_GRPC_KEEPALIVE_INTERVAL="2h0m0s"
    # - ETCD_GRPC_KEEPALIVE_TIMEOUT="20s"

    # clustering
    clustering:
    - ETCD_INITIAL_ADVERTISE_PEER_URLS="http://{{ inventory_hostname }}:2380"
    - ETCD_ADVERTISE_CLIENT_URLS="http://{{ inventory_hostname }}:2379"
    # - ETCD_DISCOVERY=""
    # - ETCD_DISCOVERY_FALLBACK="proxy"
    # - ETCD_DISCOVERY_PROXY=""
    # - ETCD_DISCOVERY_SRV=""
    - ETCD_INITIAL_CLUSTER="{% for i in groups[group_names[0]] %}etcd{{ loop.index }}=http://{{ hostvars[i]['ansible_hostname'] }}:2380{% if not loop.last %},{% endif %}{% endfor %}"
    - ETCD_INITIAL_CLUSTER_TOKEN=etcd-sample
    - ETCD_INITIAL_CLUSTER_STATE="new"
    # - ETCD_STRICT_RECONFIG_CHECK="true"
    # - ETCD_ENABLE_V2="true"

    # # proxy
    # proxy:
    # # - ETCD_PROXY="off"
    # # - ETCD_PROXY_FAILURE_WAIT="5000"
    # # - ETCD_PROXY_REFRESH_INTERVAL="30000"
    # # - ETCD_PROXY_DIAL_TIMEOUT="1000"
    # # - ETCD_PROXY_WRITE_TIMEOUT="5000"
    # # - ETCD_PROXY_READ_TIMEOUT="0"

    # # security
    # security:
    # # - ETCD_CERT_FILE=""
    # # - ETCD_KEY_FILE=""
    # # - ETCD_CLIENT_CERT_AUTH="false"
    # # - ETCD_TRUSTED_CA_FILE=""
    # # - ETCD_AUTO_TLS="false"
    # # - ETCD_PEER_CERT_FILE=""
    # # - ETCD_PEER_KEY_FILE=""
    # # - ETCD_PEER_CLIENT_CERT_AUTH="false"
    # # - ETCD_PEER_TRUSTED_CA_FILE=""
    # # - ETCD_PEER_AUTO_TLS="false"

    # # logging
    # logging:
    # # - ETCD_DEBUG="false"
    # # - ETCD_LOG_PACKAGE_LEVELS=""
    # # - ETCD_LOG_OUTPUT="default"

    # # unsafe
    # unsafe:
    # # - ETCD_FORCE_NEW_CLUSTER="false"

    # # version
    # version:
    # # - ETCD_VERSION="false"
    # # - ETCD_AUTO_COMPACTION_RETENTION="0"

    # # profiling
    # profiling:
    # # - ETCD_ENABLE_PPROF="false"
    # # - ETCD_METRICS="basic"

    # # auth
    # auth:
    # # - ETCD_AUTH_TOKEN="simple"

# etcd.conf | custom
custom_etcd_conf:
# etcd.conf | custom
- src: <path>/<to>/<src>/<file>
  dest: <path>/<to>/<dest>/<file>
  owner: <file_owner>
  group: <file_group>
  mode: "<file_mode>"
```

# `Generate TLS Cert`
## `On Local`
### `generate "ca-key.pem" "ca.csr" "ca.pem"`
``` shell
export ROOT_DIRECTORY=files/<env>/<type>/<groupname>

mkdir -p ${ROOT_DIRECTORY}
cd ${ROOT_DIRECTORY}
cat > ca-config.json << EOF
{
  "signing": {
    "default": {
        "expiry": "43800h"
    },
    "profiles": {
      "server": {
        "expiry": "43800h",
        "usages": [
          "signing",
          "key encipherment",
          "server auth",
          "client auth"
        ]
      },
      "client": {
        "expiry": "43800h",
        "usages": [
          "signing",
          "key encipherment",
          "client auth"
        ]
      },
      "peer": {
        "expiry": "43800h",
        "usages": [
          "signing",
          "key encipherment",
          "server auth",
          "client auth"
        ]
      }
    }
  }
}
EOF

cat > ca-csr.json << EOF
{
  "CN": "etcd",
  "key": {
    "algo": "rsa",
    "size": 2048
  }
}
EOF

cfssl gencert -initca ca-csr.json | cfssljson -bare ca -
```

### `generate "client-key.pem" "client.csr" "client.pem"`
``` shell
cat > client.json << EOF
{
  "CN": "client",
  "key": {
    "algo": "ecdsa",
    "size": 256
  }
}
EOF

cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=client client.json | cfssljson -bare client
```

### `Upload PEM to All ETCD Server`
``` shell
export SERVER1=<ip_addr>
export SERVER2=<ip_addr>
export SERVER3=<ip_addr>
export USER=<user>
export ETCD_TLS_DIRECTORY=/etc/etcd/tls

for i in ${SERVER1} \
${SERVER2} \
${SERVER3}
do
  scp ca.pem ${USER}@${i}:${ETCD_TLS_DIRECTORY}/ca.pem
  scp ca-key.pem ${USER}@${i}:${ETCD_TLS_DIRECTORY}/ca-key.pem
  scp client.pem ${USER}@${i}:${ETCD_TLS_DIRECTORY}/client.pem
  scp client-key.pem ${USER}@${i}:${ETCD_TLS_DIRECTORY}/client-key.pem
  scp ca-config.json ${USER}@${i}:${ETCD_TLS_DIRECTORY}/ca-config.json
done
```

## `On All ETCD Server`
### `Generate config.json`
``` shell
export PEER_NAME=$(hostname)
export PRIVATE_IP=$(ifconfig eth0 | awk '$1=="inet" { print $2 }')
export ETCD_TLS_DIRECTORY=/etc/etcd/tls
export CONFIG_JSON=config.json

cd ${ETCD_TLS_DIRECTORY}

cfssl print-defaults csr > ${CONFIG_JSON}

sed -i \
-e 's|"CN": "example.net",$|"CN": "'"${PEER_NAME}"'"|' \
-e 's|"example.net",$|"'"${PEER_NAME}"'",|' \
-e 's|"www.example.net"$|"'"${PRIVATE_IP}"'"|' \
${CONFIG_JSON}
```

### `generate "server.csr" "server-key.pem" "server.pem"`
``` shell
export ETCD_TLS_DIRECTORY=/etc/etcd/tls
export CONFIG_JSON=config.json

cd ${ETCD_TLS_DIRECTORY}

cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=server ${CONFIG_JSON} | cfssljson -bare server
```

### `generate "peer.csr" "peer-key.pem" "peer.pem"`
``` shell
export ETCD_TLS_DIRECTORY=/etc/etcd/tls
export CONFIG_JSON=config.json

cd ${ETCD_TLS_DIRECTORY}

cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=peer ${CONFIG_JSON} | cfssljson -bare peer
```
