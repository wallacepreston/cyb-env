#!/bin/bash

# Start SSH and RDP services
service ssh start
service xrdp start

ssh-keygen -lf /etc/ssh/ssh_host_ecdsa_key.pub | awk '{print $2}'

echo "SSH Private Key: \n"

cat /home/codepath/.ssh/ubuntu_key

echo "Public IP Address: $(curl -s ifconfig.me)"

# Start a bash shell
exec /bin/bash