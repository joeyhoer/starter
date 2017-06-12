#!/usr/bin/env bash

###############################################################################
# App Store
###############################################################################

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Automatically check for updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Download newly available updates in the background
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true

# Install app updates
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool true

# Install macOS updates
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired -bool true

# Install system data files and security updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool true
