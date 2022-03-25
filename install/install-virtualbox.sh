#!/bin/sh

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian focal contrib"

sudo apt update
sudo apt install virtualbox-6.1
