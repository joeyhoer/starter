#!/usr/bin/env bash

###############################################################################
# CDs & DVDs
###############################################################################

# Inserted CD & DVD Actions:
#   1 : Ignore
#   2 : Ask what to do
#   5 : Open other application…
# 100 : Open Finder
# 101 : Open iTunes
# 102 : Open Disk Utility
# Blank CD inseted
defaults write com.apple.digihub com.apple.digihub.blank.cd.appeared   -dict action 1
# Blank DVD inserted
defaults write com.apple.digihub com.apple.digihub.blank.dvd.appeared  -dict action 1
# Music CD inserted
defaults write com.apple.digihub com.apple.digihub.cd.music.appeared   -dict action 1
# Pictured CD inserted
defaults write com.apple.digihub com.apple.digihub.cd.picture.appeared -dict action 1
# Video DVD inserted
defaults write com.apple.digihub com.apple.digihub.dvd.video.appeared  -dict action 1

# Enable the MacBook Air SuperDrive on any Mac
sudo nvram boot-args="mbasd=1"
