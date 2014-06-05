#!/usr/bin/env bash


# Init bare repo
cd /gns-rules.git
git init --bare

# Copy hook
cp /post-receive /gns-rules.git/hooks/

# Fix permissions
chown -R git /gns-rules
chown -R git /gns-rules.git
chown -R git /keys

# Add authorized keys wich be able to push in this repo
echo $KEY >> /home/git/.ssh/authorized_keys
cat /keys/pub_keys  >> /home/git/.ssh/authorized_keys

# Run sshd daemon
/usr/sbin/sshd -D -e
