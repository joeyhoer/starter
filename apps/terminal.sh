#!/usr/bin/env bash

###############################################################################
# Terminal
###############################################################################

# Enable in Accessiblity Database
#sudo tccutil -e com.apple.Terminal

# Enable Secure Keyboard Entry in Terminal.app
# https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Disable line marks
defaults write com.apple.Terminal ShowLineMarks -bool false

# Only use UTF-8 in Terminal
defaults write com.apple.terminal StringEncodings -array 4

# Use a custom theme by default in Terminal.app
TERM_PROFILE='Solarized Dark xterm-256color';
osascript <<EOD
tell application "Terminal"
  local allOpenedWindows
  local initialOpenedWindows
  local windowID
  set themeName to "$TERM_PROFILE"

  # Store the IDs of all the open terminal windows.
  set initialOpenedWindows to id of every window

  # Open the custom theme so that it gets added to the list of available
  # terminal themes (note: this will open two additional terminal windows).
  do shell script "open '$HOME/init/" & themeName & ".terminal'"

  # Wait a little bit to ensure that the custom theme is added.
  delay 1

  # Set the custom theme as the default terminal theme.
  set default settings to settings set themeName

  # Get the IDs of all the currently opened terminal windows.
  set allOpenedWindows to id of every window
  repeat with windowID in allOpenedWindows
    # Close the additional windows that were opened in order to add
    # the custom theme to the list of terminal themes.
    if initialOpenedWindows does not contain windowID then
      close (every window whose id is windowID)

    # Change the theme for the initial opened terminal windows to remove
    # the need to close them in order for the custom theme to be applied.
    else
      set current settings of tabs of (every window whose id is windowID) to settings set themeName
    end if
  end repeat
end tell
EOD

# Enable "focus follows mouse" for Terminal
# i.e. hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true
# Enable "focus follows mouse" for all X11 apps
#defaults write org.x.X11 wm_ffm -bool true

# Audible and Visual Bells
/usr/libexec/PlistBuddy                                     \
    -c "Delete :WindowSettings:Basic:Bell"                  \
    -c "Add    :WindowSettings:Basic:Bell       bool false" \
    -c "Delete :WindowSettings:Basic:VisualBell"            \
    -c "Add    :WindowSettings:Basic:VisualBell bool true"  \
    ~/Library/Preferences/com.apple.terminal.plist
