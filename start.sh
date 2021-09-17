#!/bin/bash

mkdir -p /home/dev/.ssh
cp /etc/secrets/key.pub /home/dev/.ssh/authorized_keys

# Maintain correct permissions on redeploy
# dropbear complains if /home/dev is "writable by others"
chmod -R g-w /home/dev

dropbear -F -E -k -s -w
