#!/usr/bin/env bash

###############################################################################
# Dictation & Speech                                                          #
###############################################################################

# Enable Dictation
defaults write com.apple.assistant.support "Assistant Enabled" -bool true
defaults write com.apple.assistant.support "Dictation Enabled" -bool true
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs \
  DictationIMMasterDictationEnabled -bool true

# Use Enhanced Dictation
# Allows offline use and continuous dictation with live feedback
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs \
  DictationIMUseOnlyOfflineDictation -bool true

# Enable Text to Speech
defaults write com.apple.speech.synthesis.general.prefs SpokenUIUseSpeakingHotKeyFlag -bool true

# Speak selected text when the key is pressed
# Option+Esc : 2101
defaults write com.apple.speech.synthesis.general.prefs SpokenUIUseSpeakingHotKeyCombo -int 2101

# System Voice
# Creator    | ID  | Name
# -----------+-----+------
# 1835364215 | 201 | Alex
# 1734437985 | 100 | Bruce
defaults write com.apple.speech.voice.prefs SelectedVoiceCreator -int 1835364215
defaults write com.apple.speech.voice.prefs SelectedVoiceID -int 201
defaults write com.apple.speech.voice.prefs SelectedVoiceName -string "Alex"

# Speaking Rate
# Set as a multidimensional array, the first value is the SelectedVoiceCreator
# the second value is the SelectedVoiceID, and the thrid value is the speaking rate
# Slow   : 90
# Normal : 175
# Fast   : 350
/usr/libexec/PlistBuddy -x                                 \
    -c "Delete :VoiceRateDataArray"                        \
    -c "Add    :VoiceRateDataArray     array"              \
    -c "Add    :VoiceRateDataArray:0   array"              \
    -c "Add    :VoiceRateDataArray:0:0 integer 1835364215" \
    -c "Add    :VoiceRateDataArray:0:1 integer 201"        \
    -c "Add    :VoiceRateDataArray:0:2 integer 350"        \
    ~/Library/Preferences/com.apple.speech.voice.prefs.plist
