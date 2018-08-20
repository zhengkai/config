#!/bin/sh
sudo DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get -y -q update
sudo DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get -y -q -o Dpkg::Options::="--force-confnew" dist-upgrade
sudo DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get -y -q autoremove
sudo DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get -y -q autoclean

sudo rm -f /etc/ssl/certs/CNNIC_ROOT.pem || :
sudo rm -f /usr/share/ca-certificates/mozilla/CNNIC_ROOT.crt || :