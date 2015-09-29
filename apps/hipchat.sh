#!/usr/bin/env bash

###############################################################################
# HipChat                                                                     #
###############################################################################

# Swap hotkeys for "Close Tab" and "Close Window"
defaults write com.hipchat.HipChat NSUserKeyEquivalents -dict-add "Close Tab" '@$w'
defaults write com.hipchat.HipChat NSUserKeyEquivalents -dict-add "Close Window" '@w'
