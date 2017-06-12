#!/usr/bin/env bash

###############################################################################
# Mission Control
###############################################################################

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Dashboard:
# 1: Off
# 2: As Space
# 3: As Overlay
defaults write com.apple.dashboard enabled-state -int 1

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Enable Dashboard dev mode (allows keeping widgets on the desktop)
defaults write com.apple.dashboard devmode -bool true
