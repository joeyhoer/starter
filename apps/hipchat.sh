#!/usr/bin/env bash

###############################################################################
# HipChat                                                                     #
###############################################################################

# Default font size
defaults write com.hipchat.HipChat defaultFontSize -int 11

# Get account ID(s)
account_id=$(defaults read com.hipchat.HipChat accounts | sed -E 's/^{"([^"]*).*/\1/')

# Disable select notifications
/usr/libexec/PlistBuddy                             \
  -c "Set :${account_id}:disableSounds  bool true"  \
  -c "Set :${account_id}:notifyDnd      bool false" \
  ~/Library/Preferences/com.hipchat.HipChat.plist

# Swap hotkeys for "Close Tab" and "Close Window"
defaults write com.hipchat.HipChat NSUserKeyEquivalents -dict-add "Close Tab" '@$w'
defaults write com.hipchat.HipChat NSUserKeyEquivalents -dict-add "Close Window" '@w'
