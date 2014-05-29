#!/usr/bin/env bash

echo $KEYS >> /home/git/.ssh/authorized_keys
/usr/sbin/sshd -D
