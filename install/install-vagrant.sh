#!/bin/sh

#Add Hashicorp repo first with ./add-hashicorp-repo.sh

sudo apt update
sudo apt install vagrant

# to make it work with libvirt
# sudo apt install libvirt-dev
# vagrant plugin install vagrant-libvirt

