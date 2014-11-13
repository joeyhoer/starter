#!/usr/bin/env bash

###############################################################################
# Language & Region                                                           #
###############################################################################

# Prefered languages (in order of preference) 
defaults write NSGlobalDomain AppleLanguages -array "en"

# Currency
# United States : `en_US@currency=USD`
# Great Britian : `en_GB@currency=EUR`
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"

# Measure Units
# `Inches` or `Centimeters`
defaults write NSGlobalDomain AppleMeasurementUnits -string "Inches"

# Set Metric Units
defaults write NSGlobalDomain AppleMetricUnits -bool true
