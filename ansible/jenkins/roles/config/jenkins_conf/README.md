# Role Name
## jenkins_conf

# Usage
``` shell
export _INVENTORY=</path>/<to>/<inventory>
export _HN=<host_name>
export _PLAYBOOK=<path>/<to>/<playbook>
export _USERNAME=<username>

# run first time
ansible-playbook -i ${_INVENTORY} -e "hn=${_HN}" ${_PLAYBOOK} --ask-vault-pass --tags initial

# install plugin only
ansible-playbook -i ${_INVENTORY} -e "hn=${_HN}" ${_PLAYBOOK} --ask-vault-pass --tags plugins

# create credentials only
ansible-playbook -i ${_INVENTORY} -e "hn=${_HN}" ${_PLAYBOOK} --ask-vault-pass --tags credentials

# custom env only
ansible-playbook -i ${_INVENTORY} -e "hn=${_HN}" -e "username=${_USERNAME}" ${_PLAYBOOK} --ask-vault-pass --tags custom_env
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
      - role: jenkins_conf
```

# Example Varaibles
## inventory/\<env\>/\<type\>/group_vars/jenkins_conf_required_directory.yml
``` yaml
---
jenkins_conf_required_directory:
- path: /<directory>/<path>
  owner: <directory_owner>
  group: <directory_group>
  mode: "<directory_mode>"
```

## inventory/\<env\>/\<type\>/group_vars/jenkins_conf_required_data.yml
``` yaml
---
jenkins_conf_required_data:
- src: <path>/<to>/<src>/<file>
  dest: /<path>/<to>/<dest>/<file>
  owner: <file_owner>
  group: <file_group>
  mode: "<file_mode>"
```

## inventory/\<env\>/\<type\>/group_vars/jenkins_conf.yml
``` yaml
---
# config name
jenkins_conf:
- src: <path>/<to>/<src>/<file>
  dest: /<path>/<to>/<dest>/<file>
  owner: <file_owner>
  group: <file_group>
  mode: "<file_mode>"
```

## inventory/\<env\>/\<type\>/group_vars/jenkins_conf_custom.yml
``` yaml
---
jenkins_conf_custom:
# custom config name
- src: <path>/<to>/<src>/<file>
  dest: <path>/<to>/<dest>/<file>
  owner: <file_owner>
  group: <file_group>
  mode: "<file_mode>"
```

## inventory/\<env\>/\<type\>/group_vars/jenkins_info.yml (need encrypt)
``` yaml
---
jenkins_url: http://<ip_address>
jenkins_home: /data/jenkins
jenkins_user: xxxxxx
jenkins_password: "xxxxxxxxxxxxxxxxxx"
jenkins_api_token: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

## inventory/\<env\>/\<type\>/group_vars/jenkins_conf_credentials.yml (need encrypt)
``` yaml
---
jenkins_conf_credentials_custom_command:
# ansible
- command: |
    export JENKINS_URL="http://{{ jenkins_user }}:{{ jenkins_api_token }}@{{ inventory_hostname }}:8080"

    curl -s -XPOST ${JENKINS_URL}/credentials/store/system/domain/_/createCredentials \
    --data-urlencode 'json={
      "": "0",
      "credentials": {
        "scope": "GLOBAL",
        "id": "ansible",
        "username": "ansible",
        "privateKeySource": {
          "stapler-class": "com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey$DirectEntryPrivateKeySource",
          "privateKey": "-----BEGIN OPENSSH PRIVATE KEY-----\nxxxxxxxxx\n-----END OPENSSH PRIVATE KEY-----"
        },
        "description": "ansible",
        "$class": "com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey"
      }
    }'
  args_param:
    executable: /bin/bash
```

## inventory/\<env\>/\<type\>/group_vars/plugins.yml
``` yaml
jenkins_conf_plugins:
- name: gitlab-plugin
- name: slack
- name: simple-theme-plugin
- name: ssh-agent
- name: ansicolor
- name: ansible
- name: scm-sync-configuration
- name: thinBackup
- name: kubernetes-cli
```

## inventory/\<env\>/\<type\>/group_vars/systemd.yml
``` yaml
jenkins_conf_service:
- name: jenkins
```
