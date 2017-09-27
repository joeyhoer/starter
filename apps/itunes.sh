#!/usr/bin/env bash

###############################################################################
# iTunes
###############################################################################

# Don't automatically sync connected devices
defaults write com.apple.itunes dontAutomaticallySyncIPods -bool true
