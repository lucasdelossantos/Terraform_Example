#!/bin/bash
# Install Chef Server
set -e

# Environment variables
USERNAME=${CHEF_USERNAME}
FULLNAME=${CHEF_FULLNAME}
EMAIL=${CHEF_EMAIL}
PASSWORD=${CHEF_PASSWORD}
ORGNAME=${CHEF_ORGNAME}
ORGNAME_FULL=${CHEF_ORGNAME_FULL}

sudo curl -L https://packages.chef.io/files/stable/chef-server/12.19.31/ubuntu/18.04/chef-server-core_12.19.31-1_amd64.deb -o chef-server-core.deb
sudo dpkg -i chef-server-core.deb
sudo chef-server-ctl reconfigure
sudo chef-server-ctl user-create $USERNAME $FULLNAME $EMAIL $PASSWORD --filename ${USERNAME}.pem
sudo chef-server-ctl org-create $ORGNAME "$ORGNAME_FULL" --association_user $USERNAME --filename ${ORGNAME}-validator.pem
sudo chef-server-ctl reconfigure
sudo chef-server-ctl install chef-manage
sudo chef-manage-ctl reconfigure --accept-license