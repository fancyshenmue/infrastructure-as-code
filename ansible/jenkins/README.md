# Usage

# Table of Contents
- [Usage](#usage)
- [Table of Contents](#table-of-contents)
  - [Install LVM (on All Jenkins Node) (Options)](#install-lvm-on-all-jenkins-node-options)
  - [Create LVM (on All Jenkins Node) (Options)](#create-lvm-on-all-jenkins-node-options)
  - [Mount Volume (on All Jenkins Node) (Options)](#mount-volume-on-all-jenkins-node-options)
  - [Add Jenkins Account (on All Jenkins Node)](#add-jenkins-account-on-all-jenkins-node)
  - [Install Jenkins (on Master)](#install-jenkins-on-master)
  - [Install Java (on Slave)](#install-java-on-slave)
  - [Initail Jenkins Congigure (on Master)](#initail-jenkins-congigure-on-master)
  - [Install GVM (on All Jenkins Node) (Options)](#install-gvm-on-all-jenkins-node-options)
  - [Install PYENV (on All Jenkins Node) (Options)](#install-pyenv-on-all-jenkins-node-options)
  - [Install NVM (on All Jenkins Node) (Options)](#install-nvm-on-all-jenkins-node-options)
  - [Start Jenkins Service](#start-jenkins-service)
  - [Open Jenkins Web UI Initial Jenkins](#open-jenkins-web-ui-initial-jenkins)
    - [Jenkins Web UI(http://<jenkins_url>:8080)](#jenkins-web-uihttpjenkins_url8080)
      - [get password (on Jenkins server)](#get-password-on-jenkins-server)
  - [Install Jenkins Plugins (on Master)](#install-jenkins-plugins-on-master)
  - [Create Jenkins Credentials (on Master) (Options)](#create-jenkins-credentials-on-master-options)
  - [Jenkins Customize Environment (on All Jenkins Node) (Options)](#jenkins-customize-environment-on-all-jenkins-node-options)
  - [Install kubectl (on All Jenkins Node) (Options)](#install-kubectl-on-all-jenkins-node-options)
  - [Install kustomize (on All Jenkins Node) (Options)](#install-kustomize-on-all-jenkins-node-options)
  - [Install helm (on All Jenkins Node) (Options)](#install-helm-on-all-jenkins-node-options)
  - [Install Docker (on All Jenkins Node) (Options)](#install-docker-on-all-jenkins-node-options)
  - [Add Jenkins Account (on All Jenkins Node) (Options)](#add-jenkins-account-on-all-jenkins-node-options)
  - [Restart Jenkins and Docker Service (on All Jenkins Node) (Options)](#restart-jenkins-and-docker-service-on-all-jenkins-node-options)
- [Note](#note)
  - [Encrypt your sensitive info using ansible-vault](#encrypt-your-sensitive-info-using-ansible-vault)

## Install LVM (on All Jenkins Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jenkins_sample"
export _PLAYBOOK="playbook/packages/lvm.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Create LVM (on All Jenkins Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jenkins_sample"
export _PLAYBOOK="playbook/filesystem/lvm_filesystem.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Mount Volume (on All Jenkins Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jenkins_sample"
export _PLAYBOOK="playbook/config/fstab_conf.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Add Jenkins Account (on All Jenkins Node)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jenkins_sample"
export _PLAYBOOK="playbook/permission/linux_account.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Install Jenkins (on Master)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jekins-master.sample.com"
export _PLAYBOOK="playbook/packages/jenkins.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Install Java (on Slave)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jekins-slave01.sample.com"
export _PLAYBOOK="playbook/packages/adoptopenjdk.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Initail Jenkins Congigure (on Master)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jekins-master.sample.com"
export _PLAYBOOK="playbook/config/jenkins_conf.yml"
export _TAG="initial"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass --tags ${_TAG}
```

## Install GVM (on All Jenkins Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jenkins_sample"
export _PLAYBOOK="playbook/packages/gvm.yml"
export _USERNAME="jenkins"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} -e username=${_USERNAME} ${_PLAYBOOK} --ask-vault-pass
```

## Install PYENV (on All Jenkins Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jenkins_sample"
export _PLAYBOOK="playbook/packages/pyenv.yml"
export _USERNAME="jenkins"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} -e username=${_USERNAME} ${_PLAYBOOK} --ask-vault-pass
```

## Install NVM (on All Jenkins Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jenkins_sample"
export _PLAYBOOK="playbook/packages/nvm.yml"
export _USERNAME="jenkins"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} -e username=${_USERNAME} ${_PLAYBOOK} --ask-vault-pass
```

## Start Jenkins Service
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jekins-master.sample.com"
export _MODULE="systemd"
export _SERVICE="jenkins"
export _SERVICE_PARAM="started"

ansible -i ${_INVENTORY} ${_HN} -m ${_MODULE} -a "name=${_SERVICE} state=${_SERVICE_PARAM}" --ask-vault-pass
```

## Open Jenkins Web UI Initial Jenkins
### [Jenkins Web UI(http://<jenkins_url>:8080)](http://<jenkins_url>:8080)
#### get password (on Jenkins server)
``` shell
cat ~jenkins/secrets/initialAdminPassword
```

## Install Jenkins Plugins (on Master)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jekins-master.sample.com"
export _PLAYBOOK="playbook/config/jenkins_conf.yml"
export _TAGS="plugins"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass --tags ${_TAGS}
```

## Create Jenkins Credentials (on Master) (Options)
``` shell
export _KUBE_CONFIG="inventory/sample/common/host_vars/files/kubeconfig"

export _INVENTORY="inventory/hosts"
export _HN="jekins-master.sample.com"
export _PLAYBOOK="playbook/config/jenkins_conf.yml"
export _TAGS="credentials"

ansible-vault decrypt ${_KUBE_CONFIG}
ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass --tags ${_TAGS}
git checkout ${_KUBE_CONFIG}
```

## Jenkins Customize Environment (on All Jenkins Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jenkins_sample"
export _PLAYBOOK="playbook/config/jenkins_conf.yml"
export _USERNAME="jenkins"
export _TAGS="custom_env"

ansible-playbook -i ${_INVENTORY} -e "hn=${_HN}" -e "username=${_USERNAME}" ${_PLAYBOOK} --ask-vault-pass --tags ${_TAGS}
```

## Install kubectl (on All Jenkins Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jenkins_sample"
export _PLAYBOOK="playbook/packages/kubectl.yml"

ansible-playbook -i ${_INVENTORY} -e "hn=${_HN}" ${_PLAYBOOK} --ask-vault-pass
```

## Install kustomize (on All Jenkins Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jenkins_sample"
export _PLAYBOOK="playbook/packages/kustomize.yml"

ansible-playbook -i ${_INVENTORY} -e "hn=${_HN}" ${_PLAYBOOK} --ask-vault-pass
```

## Install helm (on All Jenkins Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jenkins_sample"
export _PLAYBOOK="playbook/packages/helm.yml"

ansible-playbook -i ${_INVENTORY} -e "hn=${_HN}" ${_PLAYBOOK} --ask-vault-pass
```

## Install Docker (on All Jenkins Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jenkins_sample"
export _PLAYBOOK="playbook/packages/docker.yml"

ansible-playbook -i ${_INVENTORY} -e "hn=${_HN}" ${_PLAYBOOK} --ask-vault-pass
```

## Add Jenkins Account (on All Jenkins Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN="jenkins_sample"
export _PLAYBOOK="playbook/permission/linux_account.yml"

ansible-playbook -i ${_INVENTORY} -e hn=${_HN} ${_PLAYBOOK} --ask-vault-pass
```

## Restart Jenkins and Docker Service (on All Jenkins Node) (Options)
``` shell
export _INVENTORY="inventory/hosts"
export _HN_ALL="jenkins_sample"
export _HN_MASTER="jekins-master.sample.com"
export _MODULE="systemd"
export _SERVICE_JENKINS="jenkins"
export _SERVICE_DOCKER="docker"
export _SERVICE_PARAM="restarted"

ansible -i ${_INVENTORY} ${_HN_ALL} -m ${_MODULE} -a "name=${_SERVICE_DOCKER} state=${_SERVICE_PARAM}" --ask-vault-pass
ansible -i ${_INVENTORY} ${_HN_MASTER} -m ${_MODULE} -a "name=${_SERVICE_JENKINS} state=${_SERVICE_PARAM}" --ask-vault-pass
```

# Note
## Encrypt your sensitive info using ansible-vault
``` shell
ansible-vault encrypt inventory/group_vars/jenkins_sample/files/ssh_public/ansible.pub
ansible-vault encrypt inventory/group_vars/jenkins_sample/files/ssh_public/jenkins.pub
ansible-vault encrypt inventory/host_vars/jekins-master.sample.com/jenkins_conf_credentials.yml
ansible-vault encrypt inventory/host_vars/jekins-master.sample.com/jenkins_info.yml
ansible-vault encrypt inventory/host_vars/jekins-master.sample.com/files/kubeconfig
```
