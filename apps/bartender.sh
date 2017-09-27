#!/usr/bin/env bash

###############################################################################
# Bartender 3
###############################################################################

# To show all Bartender Bar items, remove Application menu when needed
defaults write com.surteesstudios.Bartender  bartenderAutoExtendsMenuBar -bool false

# Bartender items autohides
defaults write com.surteesstudios.Bartender  bartenderBarDoesntAutohide -bool false

# Bartender has launched before
defaults write com.surteesstudios.Bartender SUHasLaunchedBefore -bool true

# Clicking Bartender will:
# 0: Open Bartender Bar
# 1: Display all items in Menu Bar
# 2: Expand Menu Bar, keep items hidden
# 3: Display Bartender Bar items in menu bar
defaults write com.surteesstudios.Bartender bartenderClick -int 3

# Insert a gap when Notification Center is hdden
defaults write com.surteesstudios.Bartender insertGap -bool false

# Check for Updates Automatically
defaults write com.surteesstudios.Bartender SUAutomaticallyUpdate -bool true

# When on battery, decrease update checking
defaults write com.surteesstudios.Bartender ReduceUpdateCheckFrequencyWhenOnBattery -bool true

# Update to Test Builds, even though they may be unstable
defaults write com.surteesstudios.Bartender SUFeedURL -string "http://www.macbartender.com/B2/updates/TestUpdates.php"

# Bartender menu bar icon visible
defaults write com.surteesstudios.Bartender showMenuBarIcon -bool true

# Bartender menu bar icon:
# Waistcoat, Bartender, Bowtie, Glasses, Star, Box
defaults write com.surteesstudios.Bartender statusBarImageNamed -string "More"

# Menu bar icon positions
defaults write com.surteesstudios.Bartender menuBarPositions -array \
  "com.apple.ScriptMonitor"              \
  "com.apple.QuickTimePlayerX"           \
  "com.apple.locationmenu"               \
  "com.adobe.acc.AdobeCreativeCloud"     \
  "com.binarynights.ForkLiftMini"        \
  "com.getdropbox.dropbox"               \
  "com.docker.docker"                    \
  AppleBluetoothExtra                    \
  AppleVolumeExtra                       \
  DisplaysExtra                          \
  "com.avatron.AirDisplayHost2"          \
  AirPortExtra                           \
  BatteryExtra                           \
  AppleClockExtra                        \
  "com.mowglii.ItsycalApp"               \
  "com.surteesstudios.Bartender"         \
  "com.apple.Spotlight"                  \
  NotificationCenter                     \
  "menuExtra.notificationcenter"

# Bartender bar icon positions
defaults write com.surteesstudios.Bartender appBartenderOrder -array \
  "com.adobe.acc.AdobeCreativeCloud"     \
  "com.binarynights.ForkLiftMini"        \
  "com.getdropbox.dropbox"               \
  DisplaysExtra

# Add login item
loginitem add "Bartender 2"
