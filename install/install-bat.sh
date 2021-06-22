#!/bin/bash

sudo apt update
sudo apt install bat 

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
