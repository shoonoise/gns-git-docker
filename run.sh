#!/usr/bin/env bash

# Add authorized keys wich be able to push in this repo
echo $KEY >> /home/git/.ssh/authorized_keys
cat /keys/pub_keys  >> /home/git/.ssh/authorized_keys

# Run sshd daemon
/usr/sbin/sshd -D -e
