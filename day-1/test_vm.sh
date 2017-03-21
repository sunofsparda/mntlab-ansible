#!/bin/bash

ansible tomcat_svr -i inventory -m setup | grep processor > vm_info
ansible tomcat_svr -i inventory -m setup | grep total >> vm_info
ansible tomcat_svr -i inventory -m setup | grep address >> vm_info
ansible tomcat_svr -i inventory -m setup | grep total >> vm_info


# - name: Renaming a folder according to the requirements
# command: mv /opt/tomcat/apache-tomcat-{{ tomcat_version }} /opt/tomcat/{{ tomcat_version }} 
# creates=/opt/tomcat/{{ tomcat_version }}
# become: yes
# become_user: root


# name: copy local filetocopy.zip to remote 
# if exists- shell: if [[ -f "../filetocopy.zip" ]]; then /bin/true; else /bin/false; fi;register: result- copy: src=../filetocopy.zip dest=/tmp/filetocopy.zipwhen: result|success