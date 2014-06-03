#!/usr/bin/env bash

echo $KEY >> /home/git/.ssh/authorized_keys
/usr/sbin/sshd -D -e
