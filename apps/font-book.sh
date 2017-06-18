#!/usr/bin/env bash

###############################################################################
# Font Book
###############################################################################

# Preview type and mode
# 0 : Custom
# 1 : Repertoire
# 2 : Sample
# 3 : Font Info
defaults write com.apple.FontBook FBPreviewTypeKey -int 1
defaults write com.apple.FontBook FBPreviewModeKey -int 1

# Resolve duplicates by moving files to the trash
defaults write com.apple.FontBook FBResolveByMovingToTrashKey -bool true

# Default sample font size
defaults write com.apple.FontBook FBSampleSize -int 18

# Default Install Location
# 1 : Computer
# 3 : User
defaults write com.apple.FontBook FBDefaultInstallDomainRef -int 3

# Sample text
defaults write com.apple.FontBook FBComparisonViewText -string 'The quick brown fox jumps over the lazy dog.'
defaults write com.apple.FontBook FBCustomSampleString -string 'The quick brown fox jumps over the lazy dog.'

# Automatic font activation
defaults write com.apple.ATS ATSAutoActivation -string "ATSAutoActivationEnable"
