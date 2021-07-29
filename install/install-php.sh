#!/bin/sh

# old installation - limited to php 7.4
#sudo apt update
#sudo apt install php php-xml
#sudo apt install composer

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php

sudo apt update
sudo apt install php7.4

# to install php 8
#sudo apt install php8.0
