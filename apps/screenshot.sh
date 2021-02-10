#!/usr/bin/env bash

###############################################################################
# Screenshot
###############################################################################

# Screenshot location
defaults write com.apple.screencapture location -string "$HOME/Pictures"

# Base name of screenshots
defaults write com.apple.screencapture name -string "screen"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Include date in screenshots
defaults write com.apple.screencapture include-date -bool true

# Show mouse pointer
defaults write com.apple.screencapture showsCursor -bool true

# Show floating thumbnail
defaults write com.apple.screencapture show-thumbnail -bool false


# Randomize screenshot names
# @link http://blog.stefanxo.com/2014/02/random-screenshot-names-on-mac-os-x/
#cron_entry='* * * * * openssl rand -base64 5 | base64 | cut -c1-5 | xargs defaults write com.apple.screencapture name'
#if ! crontab -l | fgrep "$cron_entry" >/dev/null; then
#  (crontab -l 2>/dev/null; echo "$cron_entry") | \
#    crontab -
#fi

# Screenshot filename format.
# WARNING: This approach is *dangerous*, as it modifies core system files.
#  SIP must be disabled for this method to work.
# NOTE: This approach makes a backup of system files.
# TIP: A better approach is to use an Automator workflow.
#   %@ %@ at %@:
#     %1$@ name (default: Screen Shot)
#     %2$@ date (default: yyyy-MM-dd)
#     %3$@ time (default: System "Medium" time, which must be changed globally)
#screencapturestrings='/System/Library/CoreServices/SystemUIServer.app/Contents/Resources/English.lproj/ScreenCapture.strings'
#sudo cp "$screencapturestrings" "${screencapturestrings}.bak" && \
#sudo plutil -convert xml1 "$screencapturestrings" -o - | \
#    sed -e 's#<string>%@ %@ at %@</string>#<string>%@%@%@</string>#'  \
#        -e 's#<string>-</string>#<string></string>#' \
#        -e 's#<string>.</string>#<string></string>#' \
#        -e 's#<string>%@ %@</string>#<string>%@ %@</string>#' \
#        -e 's#<string>yyyy-MM-dd</string>#<string>yyyy-MM-dd</string>#' | \
#    sudo plutil -convert binary1 -o "$screencapturestrings" -
