#!/usr/bin/env bash

# Update Composer to latest version
/usr/local/bin/composer self-update

# Add /etc/hosts entry for default gateway
echo "10.0.2.2  dev.dosomething.org" >> /etc/hosts
