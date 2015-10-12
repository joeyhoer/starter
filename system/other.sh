#!/usr/bin/env bash

###############################################################################
# Other                                                                       #
###############################################################################

# Menu bar: hide the Time Machine, Volume, User, and Bluetooth icons
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
    defaults write "${domain}" dontAutoLoad -array \
        "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
        "/System/Library/CoreServices/Menu Extras/Volume.menu" \
        "/System/Library/CoreServices/Menu Extras/User.menu"
done
defaults write com.apple.systemuiserver menuExtras -array \
    "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
    "/System/Library/CoreServices/Menu Extras/Battery.menu" \
    "/System/Library/CoreServices/Menu Extras/Clock.menu"

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Opening and closing speed of Quick Look windows
defaults write NSGlobalDomain QLPanelAnimationDuration -float 0

# Opening and closing window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Display ASCII control characters using caret notation in standard text views
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Disable Resume system-wide
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Rubber-band scrolling (doesn't affect web views)
# defaults write NSGlobalDomain NSScrollViewRubberbanding -bool false

# Disable App Nap (not recomended)
# defaults write NSGlobalDomain NSAppSleepDisabled -bool true

# Disable the crash reporter
#defaults write com.apple.CrashReporter DialogType -string "none"

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Fix for the ancient UTF-8 bug in QuickLook (http://mths.be/bbo)
# Commented out, as this is known to cause problems in various Adobe apps :(
# See https://github.com/mathiasbynens/dotfiles/issues/237
#echo "0x08000100:0" > ~/.CFUserTextEncoding

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Screenshot location
defaults write com.apple.screencapture location -string "$HOME/Pictures"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Include date in screenshots
defaults write com.apple.screencapture include-date -bool true

# Base name of screenshots
defaults write com.apple.screencapture name -string "screen"

# Randomize screenshot names
# @link http://blog.stefanxo.com/2014/02/random-screenshot-names-on-mac-os-x/
#( crontab -l 2>/dev/null; \
#  echo "* * * * * openssl rand -base64 5 | base64 | cut -c1-5 | xargs defaults write com.apple.screencapture name" ) \
#  | crontab -

# Screenshot filename format
# This is *could* be dangerous, it modifies core system files
# %1$@ name (default: Screen Shot)
# %2$@ date (default: yyyy-MM-dd)
# %3$@ time (default: System "Medium" time, which must be changed globally)
# cat /System/Library/CoreServices/SystemUIServer.app/Contents/Resources/English.lproj/ScreenCapture.strings | plutil -convert xml1 -o /dev/stdout - | sed 's/<string>%@ %@ at %@<\/string>/<string>%@-%@-%@<\/string>/' | sudo plutil -convert binary1 -o /System/Library/CoreServices/SystemUIServer.app/Contents/Resources/English.lproj/ScreenCapture.strings -

# Connecting camera opens (path to application, or '' if no application)
defaults -currentHost write com.apple.ImageCapture2 HotPlugActionPath -string ''

# Link hidden Applications
hidden_apps=(
  'Archive Utility'
  'Directory Utility'
  'Screen Sharing'
  'Network Utility'
  'Wireless Diagnostics'
  'Feedback Assistant'
  'RAID Utility'
  'System Image Utility'
)

for app in "${hidden_apps[@]}"; do
  sudo ln -s "/System/Library/CoreServices/Applications/${app}.app" \
             "/Applications/Utilities/${app}.app"
done

hidden_apps=(
  'Ticket Viewer'
  'Network Diagnostics'
)

for app in "${hidden_apps[@]}"; do
  sudo ln -s "/System/Library/CoreServices/${app}.app" \
             "/Applications/Utilities/${app}.app"
done

 # Link hidden prefPanes
sudo ln -s '/System/Library/CoreServices/Applications/Archive Utility.app/Contents/Resources/Archives.prefPane' \
           '/Library/PreferencePanes/Archives.prefPane'

# Link hidden command line tools
sudo ln -s '/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport' \
           '/usr/sbin/airport'
sudo ln -s '/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc' \
           '/usr/local/bin/jsc'
