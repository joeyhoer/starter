#!/usr/bin/env bash

###############################################################################
# CopyClip
###############################################################################

# Hide welcome message
defaults write com.fiplab.clipboard FirstRun -bool false

# Invert menubar icon colors, for use with dark mode
# sudo find /Applications/CopyClip.app/Contents/Resources/ -name icon-statusbar* -exec mogrify -negate "{}" \;
