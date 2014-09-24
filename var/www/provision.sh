#!/bin/bash
set -x

function error() {
  echo -e "\e[0;33mERROR: Provisioning failed running $BASH_COMMAND at line $BASH_LINENO of $(basename $0) \e[0m" >&2
  exit 1
}

trap error ERR

# force ntp sync
sntp -s wbench.lab.local

# Allow Cumulus testing repo
sed -i /etc/apt/sources.list -e 's/^#\s*\(deb.*testing.*\)$/\1/g'

# Upgrade and install Puppet
apt-get update -y
apt-get upgrade -y
apt-get install puppet -y

echo "Configuring puppet" | wall -n
sed -i /etc/default/puppet -e 's/START=no/START=yes/'

# Commenting out pluginsync until plugins need syncing
#sed -i /etc/puppet/puppet.conf -e 's/\[main\]/\[main\]\npluginsync=true/'

service puppet stop

# CUMULUS-AUTOPROVISIONING

exit 0
