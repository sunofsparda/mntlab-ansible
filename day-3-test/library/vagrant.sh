#!/bin/bash


function vagrant_up
 {
    if [ -d "$path" ]; then
        msg="ok"

	status_before=$(vagrant status | grep default | awk '{print $2}')
        vagrant up >> /dev/null
        
        ip=$(vagrant ssh-config | grep HostName | awk '{print $2}')
        port=$(vagrant ssh-config | grep Port | awk '{print $2}')
        status=$(vagrant status | grep default | awk '{print $2}')
        os_name=$(vagrant ssh -c "cat /etc/redhat-release" 2>/dev/null)
        ram=$(vagrant ssh -c "cat /proc/meminfo | grep MemTotal | awk '{print \$2}'" 2>/dev/null)

        if [ "$status" == "$status_before" ];
	then
		changed=false
	else
		changed=true
	fi

        printf '{"failed": false, "changed": %s, "ip": "%s", "port": %s, "status": "%s", "os_name": "%s", "ram": "%s"}' "$changed" "$ip" "$port" "$status" "$os_name" "$ram"
        exit 0
    else
        changed="true"
        failed="true"
        msg="File doesnt exists"
    fi
 }

function vagrant_halt
 {
    if [ -d "$path" ]; then
        vagrant halt
    else
        changed="true"
        failed="true"
        msg="File doesnt exists"
    fi
 }

 function vagrant_destroy
 {
    if [ -d "$path" ]; then
        vagrant destroy >> /dev/null
    else
        changed="true"
        failed="true"
        msg="File doesnt exists"
    fi
 }

 
source $1

if [ -z "$path" ]; then
     printf '{"failed": true, "msg": "missing required arguments: path"}'
     exit 1
fi
if [ -z "$state" ]; then
     printf '{"failed": true, "msg": "missing required arguments: state"}'
     exit 1
fi


case $state in
     started)
         vagrant_up
         ;;
     stopped)
         vagrant_halt
         ;;
     destroyed)
         vagrant_destroy
         ;;
     *)
         printf '{"failed": true, "msg": "invalid state: %s"}' "$state"
         exit 1
         ;;
 esac

# ip=$(vagrant ssh-config | grep -v '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}')
# port=$(vagrant ssh-config | grep Port | cut -d " " -f4)

#ip=$(printf "$ip" | python -c 'import json,sys; print json.dumps(sys.stdin.read())')

printf '{"failed": false, "changed": true, "ip": "%s", "port": "%s"}' "$ip" "$port"


exit 0
