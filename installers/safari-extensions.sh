#!/usr/bin/env bash

###############################################################################
# Safari Extensions
###############################################################################

# Safari applications array
safari_browsers="/Applications/Safari.app"
# "/Applications/Safari Technology Preview.app"
# "/Applications/WebKit.app"

# Safari extensions array
safari_extensions=(
  "http://download.livereload.com/2.1.0/LiveReload-2.1.0.safariextz"
  "http://sobolev.us/download/stylish/stylish.safariextz"
)

# Download extensions
for safari in "${safari_browsers[@]}"; do
  for extension in "${safari_extensions[@]}"; do
    # Overwrite existing files
    wget -qcP ~/Downloads "$extension"
  done
done

# Install extensions
osascript <<EOD
tell application "Finder"
  set safariextzs to $(IFS=,; sed 's/,/","/g' <<< "{\"${safari_extensions[*]##*/}\"}")
  repeat with safariextz in safariextzs
    set safariextz to file ((home as Unicode text) & "Downloads:" & safariextz)
    if exists safariextz then
      ignoring application responses
        tell application "Safari" to open safariextz
      end ignoring
      tell application "System Events"
        tell process "Safari"
          set frontmost to true
          -- window "Extensions"
          repeat until (exists window 1) and subrole of window 1 is in {"AXStandardWindow", "AXDialog"}
            delay 1
          end repeat
          if exists (sheet 1 of window 1) then
            click button 1 of sheet 1 of window 1 -- "Install from Gallery" or "Trust"
          else
            click button 1 of window 1 -- Error "OK"
          end if
        end tell
      end tell
    end if
  end repeat
end tell
EOD

# Cleanup
# Generally, if an extension is installed successfully,
# the safariextz is removed from the location where it was installed.
# However, if the extension is installed from the "Extension Gallery",
# Safari will install it directly, leaving the safariextz file in place.
for extension in "${safari_extensions[@]}"; do
  rm ~/Downloads/${extension[@]##*/} 2>/dev/null
done
