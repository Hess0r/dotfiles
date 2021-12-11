#!/bin/bash

# Find a way to use the permanent solution:
# /etc/modprobe.d/hid_apple.conf
# options hid_apple fnmode=0

echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode
