# Roles Name
## linux_account

# Table Content
- [Roles Name](#roles-name)
  - [linux_account](#linux_account)
- [Table Content](#table-content)
- [Usage](#usage)
  - [common account](#common-account)
  - [add auth key](#add-auth-key)
  - [remove account](#remove-account)
- [Example Inventory](#example-inventory)
- [Example Playbook](#example-playbook)
- [Example Variables](#example-variables)
  - [group_vars/\<group_name\>/linux_account_common.yml](#group_varsgroup_namelinux_account_commonyml)
  - [group_vars/\<group_name\>/linux_account_required_group.yml](#group_varsgroup_namelinux_account_required_groupyml)
  - [group_vars/\<group_name\>/linux_account_required_directory.yml](#group_varsgroup_namelinux_account_required_directoryyml)
  - [group_vars/\<group_name\>/linux_account_required_user.yml](#group_varsgroup_namelinux_account_required_useryml)
  - [group_vars/\<group_name\>/linux_account_required_env.yml](#group_varsgroup_namelinux_account_required_envyml)
  - [group_vars/\<group_name\>/linux_account_required_auth.yml](#group_varsgroup_namelinux_account_required_authyml)
  - [group_vars/\<group_name\>/linux_account_remove_user.yml (if remove account)](#group_varsgroup_namelinux_account_remove_useryml-if-remove-account)
- [Generate Password Hash](#generate-password-hash)

# Usage
## common account
``` shell
ansible-playbook -i <path>/<to>/<inventory> -e hn=<hostname> <path>/<to>/<playbook> --ask-vault-pass
```
## add auth key
``` shell
ansible-playbook -i <path>/<to>/<inventory> -e hn=<hostname> --tags required_auth <path>/<to>/<playbook>
```
## remove account
``` shell
ansible-playbook -i <path>/<to>/<inventory> -e hn=<hostname> --tags remove <path>/<to>/<playbook>
```

# Example Inventory
``` ini
[<groupname>]
<hostname> ansible_user=<ansibleUser>
<hostname> ansible_user=<ansibleUser>
<hostname> ansible_user=<ansibleUser>
```


# Example Playbook
``` yaml
---
- hosts: '{{ hn }}'
  gather_facts: no
  roles:
    - role: linux_account
      become: True
      become_user: root
      become_method: sudo
```

# Example Variables
## group_vars/\<group_name\>/linux_account_common.yml
``` yaml
---
# group info
group_wheel: wheel
group_automation: 'automation'
gid_automation: '60001'

# account info
user_ansible: 'ansible'
uid_ansible: '60001'

# required directory
home_root: "/home"
home_automation: "/home/automation"
home_ansible: "{{ home_automation }}/ansible"
home_ansible_dev: "{{ home_ansible }}/dev"
```

## group_vars/\<group_name\>/linux_account_required_group.yml
``` yaml
---
# group wheel
group_wheel: wheel

# group admin gid
group_automation: 'automation'
gid_automation: '60001'

linux_account_required_group:
- name: "{{ group_automation }}"
  gid: "{{ gid_automation }}"
```

## group_vars/\<group_name\>/linux_account_required_directory.yml
``` yaml
---
linux_account_required_directory:
- path: "{{ home_automation }}"
  owner: root
  group: root
  mode: "0755"
```

## group_vars/\<group_name\>/linux_account_required_user.yml
``` yaml
---
linux_account_required_user:
- name: '{{ user_ansible }}'
  uid: '{{ uid_ansible }}'
  group: '{{ group_automation }}'
  groups: '{{ group_wheel }}'
  append: "no"
  home: '{{ home_automation }}/{{ user_ansible }}'
```

## group_vars/\<group_name\>/linux_account_required_env.yml
``` yaml
---
linux_account_required_env:
- path: "{{ home_ansible }}/.bashrc"
  template: "{{ bashrc_template }}"
```

## group_vars/\<group_name\>/linux_account_required_auth.yml
``` yaml
---
linux_account_required_auth:
- name: "{{ user_ansible }}"
  key: '{{ inventory_dir }}/group_vars/{{ group_names[0] }}/files/ssh_public/ansible.pub'
```

## group_vars/\<group_name\>/linux_account_remove_user.yml (if remove account)
``` yaml
---
linux_account_remove_user:
- name: '{{ user_ansible }}'
```

# Generate Password Hash
``` shell
pip install passlib
python -c "from passlib.hash import sha512_crypt; import getpass; print(sha512_crypt.using(rounds=5000).hash(getpass.getpass()))"
Password: <input_password>
```
