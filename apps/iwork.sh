#!/usr/bin/env bash

###############################################################################
# iWork
###############################################################################

## Keynote

#defaults write com.apple.iWork.Keynote 'ShowStartingPointsForNewDocument' -bool false
defaults write com.apple.iWork.Keynote 'dontShowWhatsNew' -bool true
defaults write com.apple.iWork.Keynote 'FirstRunFlag' -bool true


## Numbers

#defaults write com.apple.iWork.Numbers 'ShowStartingPointsForNewDocument' -bool false
defaults write com.apple.iWork.Numbers 'dontShowWhatsNew' -bool true
defaults write com.apple.iWork.Numbers 'FirstRunFlag' -bool true

# Hotkey for "File > Export To > CSV…"
defaults write com.apple.iWork.Numbers NSUserKeyEquivalents -dict-add "\033File\033Export To\033CSV…" '^~@s'


# Pages

#defaults write com.apple.iWork.Pages 'ShowStartingPointsForNewDocument' -bool false
defaults write com.apple.iWork.Pages 'dontShowWhatsNew' -bool true
defaults write com.apple.iWork.Pages 'FirstRunFlag' -bool true
