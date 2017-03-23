#!/bin/sh

# 3. Develop custom module to manage VirtualBox:
# Arguments: 
# - path to vagrantfile
# - state: started, stopped, destroyed
# Return values:
# - state: running, stopped, not created
# - ip address, port
# - path to ssh key file
# - username to connect to VM
# - os_name
# - RAM size
# Errors:
# - file doesn’t exists
# - failed on creation
# - etc

