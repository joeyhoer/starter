#!/usr/bin/env bash

###############################################################################
# Powerline
###############################################################################

# Install Powerline Fonts
git clone https://github.com/powerline/fonts.git /Library/Fonts/Powerline\ Fonts

# Run this before any other powerline-related code
# in the shell configuration file.
# http://powerline.readthedocs.org/en/latest/usage/shell-prompts.html#shell-prompts
powerline-daemon -q

# Source theme(s)
powerline_base=$(pip show powerline-status | awk '{FS = ": "} $1 ~ /Location/ {print $2}')
source "${powerline_base}/powerline/bindings/zsh/powerline.zsh"
