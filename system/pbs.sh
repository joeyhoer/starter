
#!/usr/bin/env bash

###############################################################################
# Services Menu Agent
###############################################################################

# Need to use PlistBuddy here
defaults write pbs NSServicesStatus -dict-add '"com.apple.Terminal - New Terminal at Folder - newTerminalAtFolder"' '{
  "enabled_context_menu" = 1;
  "enabled_services_menu" = 1;
}'

/System/Library/CoreServices/pbs -flush
