#!/usr/bin/env bash

###############################################################################
# Disk Utility
###############################################################################

# Enable the debug menu in Disk Utility
#defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# Show All Devices
defaults write com.apple.DiskUtility SidebarShowAllDevices -bool true
