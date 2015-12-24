#!/usr/bin/env bash

###############################################################################
# Bartender 2                                                                 #
###############################################################################

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

# Update to Test Builds, even though they may be unstable
defaults write com.surteesstudios.Bartender SUFeedURL -string "http://www.macbartender.com/B2/updates/TestUpdates.php"

# Bartender menu bar icon visible
defaults write com.surteesstudios.Bartender showMenuBarIcon -bool false

# Bartender menu bar icon:
# Waistcoat, Bartender, Bowtie, Glasses, Star, Box
defaults write com.surteesstudios.Bartender statusBarImageNamed -string "Box"

# Add login item
loginitem add "Bartender 2"
