#!/usr/bin/env bash

###############################################################################
# Bluetooth
###############################################################################

# Improve sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 48
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" 40
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool" 48
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Max" 53
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Min" 48
defaults write com.apple.BluetoothAudioAgent "Stream - Flush Ring on Packet Drop (editable)" 30
defaults write com.apple.BluetoothAudioAgent "Stream - Max Outstanding Packets (editable)" 15
defaults write com.apple.BluetoothAudioAgent "Stream Resume Delay" "0.75"
