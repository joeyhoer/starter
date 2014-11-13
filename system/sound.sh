#!/usr/bin/env bash

###############################################################################
# Sound                                                                       #
###############################################################################

# System alert sound
# Defaults sounds located in `/System/Library/Sounds/`; test with `afplay`
# Basso         Blow          Bottle        Frog
# Funk          Glass         Hero          Morse
# Ping          Pop           Purr          Sosumi
# Submarine     Tink
defaults write com.apple.systemsound com.apple.sound.beep.sound -string "/System/Library/Sounds/Funk.aiff"

# Play user interface sound effects
defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -bool false

# Play feedback when volume is changed
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool true

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "
