#!/usr/bin/env bash

###############################################################################
# Messages
###############################################################################

# Disable automatic emoji substitution (i.e. use plain text smileys)
#defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Disable smart quotes as it’s annoying for messages that contain code
#defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Disable continuous spell checking
#defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

# Save history when conversations are closed
defaults write com.apple.iChat SaveConversationsOnClose -bool true

# Test size
# 1: Small
# 7: Large
defaults write com.apple.iChat TextSize -int 2

# Anumate buddy pictures
defaults write com.apple.iChat AnimateBuddyPictures -bool false

# Play sound effects
defaults write com.apple.messageshelper.AlertsController PlaySoundsKey -bool false

# Notify me when my name is mentioned
defaults write com.apple.messageshelper.AlertsController SOAlertsAddressMeKey -bool false

# Notify me about messages form unknown contacts
defaults write com.apple.messageshelper.AlertsController NotifyAboutKnockKnockKey -bool false

# Show all buddy pictures in conversations
defaults write com.apple.iChat ShowAllBuddyPictures -bool false
