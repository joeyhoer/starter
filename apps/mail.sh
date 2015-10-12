#!/usr/bin/env bash

###############################################################################
# Mail                                                                        #
###############################################################################

# Disable send and reply animations in Mail.app
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
#defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"

# Disable inline attachments (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# Disable automatic spell checking
defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"

# Show To/Cc label in message list
defaults write com.apple.mail EnableToCcInMessageList -bool true

# Sort Inbox by unread
sudo /usr/libexec/PlistBuddy                                               \
    -c "Delete :InboxViewerAttributes:SortOrder"                           \
    -c "Add    :InboxViewerAttributes:SortOrder       string 'readstatus'" \
    ~/Library/Containers/com.apple.mail/Data/Library/Preferences/com.apple.mail.plist
