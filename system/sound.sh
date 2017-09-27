#!/usr/bin/env bash

###############################################################################
# Sound
###############################################################################

# System alert sound
# Defaults sounds located in `/System/Library/Sounds/`; test with `afplay`
# Basso         Blow          Bottle        Frog
# Funk          Glass         Hero          Morse
# Ping          Pop           Purr          Sosumi
# Submarine     Tink
defaults write com.apple.systemsound com.apple.sound.beep.sound -string "/System/Library/Sounds/Blow.aiff"

# Play user interface sound effects
defaults write com.apple.systemsound com.apple.sound.uiaudio.enabled -bool false

# Play feedback when volume is changed
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool false

# Disable flashing the screen when an alert sound occurs (accessibility)
defaults write NSGlobalDomain com.apple.sound.beep.flash -bool false

# Alert volume
# Slider level:
#  "75%": 0.7788008
#  "50%": 0.6065307
#  "25%": 0.4723665
defaults write NSGlobalDomain com.apple.sound.beep.volume -float 0.6065307

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "
