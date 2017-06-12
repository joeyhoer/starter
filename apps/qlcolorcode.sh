#!/usr/bin/env bash

###############################################################################
# QLColorCode
###############################################################################

# Set font
defaults write org.n8gray.QLColorCode font Monaco

# Set font size
defaults write org.n8gray.QLColorCode fontSizePoints 9

# Set hightlight theme
#defaults write org.n8gray.QLColorCode hlTheme ide-xcode

# Add extra highlight flags
# -l: Print line numbers in output file
# -V: Wrap long lines without indenting function parameters and statements
defaults write org.n8gray.QLColorCode extraHLFlags '-l -V'
