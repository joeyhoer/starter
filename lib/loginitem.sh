#!/usr/bin/env bash

# Manage login items from the command line
loginitem() {
  if [[ "$1" == 'add' ]]; then
    osascript -e "tell application \"System Events\" to make new login item \
      at end with properties { \
        path: POSIX path of (path to application \"$2\"), \
        hidden: false \
      }" >/dev/null
  elif [[ "$1" == 'remove' ]]; then
    osascript -e "tell application \"System Events\" to delete login item \
      \"$2\""
  elif [[ "$1" == 'list' ]]; then
    osascript -e 'tell application "System Events" to get the name of every login item'
  fi
}
