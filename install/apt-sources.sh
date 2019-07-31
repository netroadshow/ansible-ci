#!/bin/sh

cd /tmp/install
apt-get update
apt-get install -yy wget gnupg

# Fish shell to run fish scripts
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /' >/etc/apt/sources.list.d/shells:fish:release:3.list
wget -nv https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key -O Release
apt-key add - <Release
apt-get update
