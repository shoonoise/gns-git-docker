#!/usr/bin/env bash


# Init bare repo
cd /gns-rules.git
git init --bare

# Copy hook
cp /post-receive /gns-rules.git/hooks/

# Add authorized keys wich be able to push in this repo
echo $KEY >> /etc/ssh/authorized_keys
cat /keys/pub_keys  >> /etc/ssh/authorized_keys

# Run sshd daemon
/usr/sbin/sshd -D -e
