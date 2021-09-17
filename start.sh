#!/bin/bash

mkdir -p /home/dev/.ssh
cp /etc/secrets/key.pub /home/dev/.ssh/authorized_keys

dropbear -F -E -k -s -w
