#!/usr/bin/env bash

###############################################################################
# Energy Saver
###############################################################################

# Standby delay in seconds
# Default  : 3600
# 24 Hours : 86400
sudo pmset -a standbydelay 86400

# Power management settings
# `man pmset` for a full list of settings
IS_LAPTOP=`/usr/sbin/system_profiler SPHardwareDataType 2>/dev/null | grep "Model Identifier" | grep "Book"`
if [[ "$IS_LAPTOP" != "" ]]; then

    # Notebook: Battery
    sudo pmset -b         \
        sleep         15  \
        disksleep     10  \
        displaysleep   5  \
        halfdim        1

    # Notebook: Power Adapter
    sudo pmset -c         \
        sleep          0  \
        disksleep      0  \
        displaysleep  30  \
        halfdim        1  \
        autorestart    1  \
        womp           1

else

    # Desktop
    sudo pmset            \
        sleep          0  \
        disksleep      0  \
        displaysleep  30  \
        halfdim        1

fi

# Never go into computer sleep mode
sudo systemsetup -setcomputersleep off > /dev/null

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Play iOS charging sound when power is connected
defaults write com.apple.PowerChime ChimeOnAllHardware -bool true && \
  open /System/Library/CoreServices/PowerChime.app &
