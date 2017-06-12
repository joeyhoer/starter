#!/usr/bin/env bash

###############################################################################
# TotalTerminal
# Note: To enable TotalTerminal in macOS, SIP mut be disabled.
# To disable SIP, boot into the Recovery Partition and run the
# following commands:
#     csrutil disable
#     csrutil enable --without fs
# This will disable only filesystem integrity protection.
###############################################################################

# Slide Visor when Terminal is activated
defaults write com.apple.terminal TotalTerminalAutoSlideOnActivation -bool true

# Slide Visor window
defaults write com.apple.terminal TotalTerminalVisorUseFade -bool true

# Fade Visor window
defaults write com.apple.terminal TotalTerminalVisorUseFade -bool false

# Visor window
defaults write com.apple.terminal TotalTerminalVisorAnimationSpeed -float 0.2

# Show menubar icon
defaults write com.apple.terminal TotalTerminalShowStatusItem -bool false

# Tab switching with ⌘ + <number>
defaults write com.apple.terminal TotalTerminalTabSwitchingViaCmd -bool true

# Disable Quit `⌘Q` shortcut (to prevent accidental quitting)
defaults write com.apple.terminal NSUserKeyEquivalents -dict-add "Quit Terminal" nil
