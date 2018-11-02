#!/usr/bin/env bash

###############################################################################
# General
###############################################################################

# Set appearance
# Blue     : 1
# Graphite : 6
defaults write NSGlobalDomain AppleAquaColorVariant -int 6

# Highlight color
# Graphite : `0.780400 0.815700 0.858800`
# Silver   : `0.776500 0.776500 0.776500`
# Blue     : `0.709800 0.835300 1.000000`
defaults write NSGlobalDomain AppleHighlightColor -string '0.780400 0.815700 0.858800'

# Use Dark menu bar and Dock
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# Automatically hide and show the menu bar
# defaults write NSGlobalDomain "_HIHideMenuBar" -bool true

# Sidebar icon size
# Small  : 1
# Medium : 2
# Large  : 3
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Scroll bar visibility
# Possible values: `WhenScrolling`, `Automatic` and `Always`
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Smooth scrolling
# Disable on older Macs
#defaults write NSGlobalDomain NSScrollAnimationEnabled -bool false

# Close windows when quitting an application
#defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Set number of recent items (Applications, Document, Servers)
# PlistBuddy approach appears broken:
# RecentApplications, RecentDocuments, RecentServers
#/usr/libexec/PlistBuddy -x -c "Set :RecentApplications:MaxAmount 0" ~/Library/Preferences/com.apple.recentitems.plist
for category in 'applications' 'documents' 'servers'; do
   /usr/bin/osascript -e "tell application \"System Events\" to tell appearance preferences to set recent $category limit to 10"
done

# Allow Handoff between this Mac and your iCloud devices
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool true
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool true

# Disable Auto Save, Versions and Resume
# defaults write -g ApplePersistence -bool false

# Disable Crash Reporter dialog
# defaults write com.apple.CrashReporter DialogType none

# Display crash reports in Notification Center (instead of dialog)
defaults write com.apple.CrashReporter UseUNC 1
