#!/usr/bin/env bash

###############################################################################
# SSD Optimizations                                                           #
###############################################################################

# Disable local Time Machine snapshots
hash tmutil &> /dev/null && sudo tmutil disablelocal

# Disable hard disk sleep
sudo pmset -a disksleep 0

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Set hibernatefile to `/dev/null` so it will not be recreated
sudo pmset -a hibernatefile /dev/null
# Remove the sleep image file to save disk space
sudo rm /Private/var/vm/sleepimage

# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0
