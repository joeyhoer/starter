#!/usr/bin/env bash

###############################################################################
# Notifications
###############################################################################

# Disable Notification Center and remove the menu bar icon
#launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# Notification banner on screen time
# Default 5 seconds
defaults write com.apple.notificationcenterui bannerTime 2
