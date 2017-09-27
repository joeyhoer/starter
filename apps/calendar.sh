#!/usr/bin/env bash

###############################################################################
# Calendar
###############################################################################

# General
###############################################################################

# Days per week
defaults write com.apple.iCal "n days of week" -int 5

# Start week on:
# 0: Sunday
# 6: Saturday
defaults write com.apple.iCal "first day of week" -int 0

# Scroll in week view by:
# 0: Day
# 1: Week
# 2: Week, Stop on Today
defaults write com.apple.iCal "scroll by weeks in week view" -int 0

# Day starts at:
defaults write com.apple.iCal "first minute of work hours" -int 480

# Day ends at:
defaults write com.apple.iCal "last minute of work hours" -int 1080

# Show X hours at a time
defaults write com.apple.iCal "number of hours displayed" -int 12

# Advanced
###############################################################################

# Turn on timezone support
defaults write com.apple.iCal "TimeZone support enabled" -bool true

# Show events in year view
defaults write com.apple.iCal "Show heat map in Year View" -bool true

# Show week numbers
defaults write com.apple.iCal "Show Week Numbers" -bool true

# Open events in seperate windows
# defaults write com.apple.iCal OpenEventsInWindowType -bool true

# Ask before sending changes to events
defaults write com.apple.iCal WarnBeforeSendingInvitations -bool true


