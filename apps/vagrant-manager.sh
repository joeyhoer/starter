#!/usr/bin/env bash

###############################################################################
# Vagrant Manager
###############################################################################

# Terminal preference (Terminal, iTerm)
defaults write lanayo.vagrant-manager terminalPreference -string "Terminal"

# Status bar icon (clean, flat)
defaults write lanayo.vagrant-manager statusBarIconTheme -string "clean"

# Don't show running VM count
defaults write lanayo.vagrant-manager dontShowRunningVmCount -bool true

# Don't show update notification
defaults write lanayo.vagrant-manager dontShowUpdateNotification -bool true

# Use instance path as display name
# Use the path to the vagrant instance for the menu item label
defaults write lanayo.vagrant-manager usePathAsInstanceDisplayName -bool false

# Include machine names
# Include machine naes ins top-level menu item labels
defaults write lanayo.vagrant-manager includeMachineNamesInMenu -bool true

# Auto-close task window
# Automatically close the task output window if the task was successful
defaults write lanayo.vagrant-manager autoCloseTaskWindows -bool true

# Don't animate status icon
defaults write lanayo.vagrant-manager dontAnimateStatusIcon -bool true

# Refresh rate (in seconds)
defaults write lanayo.vagrant-manager refreshEveryInterval -int 60

# Show task notifications
defaults write lanayo.vagrant-manager showTaskNotification -bool false

# Allowed updates
# stable
# rc
# beta
# alpha
# debug
defaults write lanayo.vagrant-manager updateStability -string "stable"

# Send anonymous profile data
defaults write lanayo.vagrant-manager SUSendProfileInfo -bool true

# Require option key for destroy
defaults write lanayo.vagrant-manager optionKeyDestroy -bool true
