#!/usr/bin/env bash

###############################################################################
# Keyboard                                                                    #
###############################################################################

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Adjust keyboard brightness in low light
defaults write com.apple.BezelServices kDim -bool true
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool true

# Dim keyboard after idle time (in seconds)
defaults write com.apple.BezelServices kDimTime -int 300
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Keyboard Dim Time" -int 300

# Full Keyboard Access
# In windows and dialogs, press Tab to move keyboard focus between:
# 1 : Text boxes and lists only
# 3 : All controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Use F1, F2, etc. keys as standard function keys
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool false

# Stop iTunes from responding to the keyboard media keys
#launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Use smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Use smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Correct spelling automatically
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Keyboard Shortcuts (these are case insensitive)
# Modifier key legend:
#   @    ⌘  Command
#   ^    ⌃  Control
#   ~    ⌥  Option
#   $    ⇧  Shift
#   nil     No shortcut
# Note: The "$" character may need to be escaped, as usual, in Bash commands
# http://support.apple.com/kb/HT1343
