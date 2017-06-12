#!/usr/bin/env bash

###############################################################################
# Mail
###############################################################################

# Disable send and reply animations in Mail.app
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Add keyboard shortcut to send an email (⌘ + Enter)
#defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string $'@\U21a9'

# Add keyboard shortcut to create bulleted list (⌘L)
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "\033Format\033Lists\033Insert Bulleted List" -string '@l'
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "\033Format\033Lists\033Insert Numbered List" -string '~@l'
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "\033Format\033Lists\033Convert to Bulleted List" -string '$@l'
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "\033Format\033Lists\033Convert to Numbered List" -string '$@l'
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "\033Format\033Lists\033Increase List Level" -string $'^@\U2192'
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "\033Format\033Lists\033Decrease List Level" -string $'^@\U2190'

# Disable inline attachments (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# View conversations:
# Show most recent messages at the top
defaults write com.apple.mail ConversationViewSortDescending -bool true

# Checking Spelling
# Note: NSAllowContinuousSpellChecking must be enabled
# While Typing   : InlineSpellCheckingEnabled
# Before Sending : SpellCheckingOnSendEnabled
# Never          : NoSpellCheckingEnabled
defaults write com.apple.mail SpellCheckingBehavior -string "InlineSpellCheckingEnabled"

# Show To/Cc label in message list
defaults write com.apple.mail EnableToCcInMessageList -bool true

# Sort Inbox by unread
sudo /usr/libexec/PlistBuddy                                               \
    -c "Delete :InboxViewerAttributes:SortOrder"                           \
    -c "Add    :InboxViewerAttributes:SortOrder       string 'readstatus'" \
    ~/Library/Containers/com.apple.mail/Data/Library/Preferences/com.apple.mail.plist
