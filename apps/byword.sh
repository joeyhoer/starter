#!/usr/bin/env bash

###############################################################################
# Byword
###############################################################################

# Hide welcome message
defaults write com.metaclassy.byword BywordDefaultsWelcomeScreenShouldAppear -bool false
defaults write com.metaclassy.byword BywordHasRunBefore -bool true

# Preferred plain text file extension
defaults write com.metaclassy.byword BywordPreferredPlainTextFileExtension -string "md"

# Default text format
# 1: Rich Text
# 2: Markdown (Plain Text)
defaults write com.metaclassy.byword BywordDefaultDocumentFormat -int 2

# Theme
# 0: Dark
# 1: Light
defaults write com.metaclassy.byword BywordUseDefaultTheme -int 0

# Text width
# 425: Narrow
# 610: Medium
# 850: Wide
defaults write com.metaclassy.byword BywordTextWidthCurrent -int 850

# Text area height
defaults write com.metaclassy.byword BywordTextHeightPercent -float 0.85

# Focus level
#  0: Disabled
#  1: Line Focus
# 10: Paragraph Focus
defaults write com.metaclassy.byword BywordFocusLevel -int 0

# Typewrite Mode
defaults write com.metaclassy.byword BywordTypewriterMode -bool false

# Show counters
defaults write com.metaclassy.byword BywordDisplayTextCounters -bool false

# Export includes theme
defaults write com.metaclassy.byword BywordUseThemeOnExport -bool false

# Check spelling while typing
defaults write com.metaclassy.byword BywordContinuousSpellChecking -bool true

# Check grammar with spelling
defaults write com.metaclassy.byword BywordGrammarChecking -bool true

# Correct spelling automatically
defaults write com.metaclassy.byword BywordAutomaticSpellingCorrection -bool false
