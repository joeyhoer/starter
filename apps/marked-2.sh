#!/usr/bin/env bash

###############################################################################
# Marked 2                                                                    #
###############################################################################

# Show style picker
defaults write com.brettterpstra.marked2 showStylePicker -bool false

# Show overview on launch
defaults write com.brettterpstra.marked2 showQuickOverviewOnLaunch -bool false

# Preview
###############################################################################

# Scroll to first edit
defaults write com.brettterpstra.marked2 scrollToEdit -bool true

# Show Edit Marker
defaults write com.brettterpstra.marked2 showEditMarker -bool true

# Enable Mini Map navigation
defaults write com.brettterpstra.marked2 enableMiniMap -bool true

# Headline collapse sections
defaults write com.brettterpstra.marked2 collapsibleHeadlines -bool false

# Require cmd-click to collapse sections
defaults write com.brettterpstra.marked2 requireCmdToCollapse -bool true

# Show scroll progress indicator
defaults write com.brettterpstra.marked2 showDocumentProgress -bool true

# Table of Contents tracks scroll position
defaults write com.brettterpstra.marked2 TOCTracksPosition -bool true

# Popup stats for text selection
defaults write com.brettterpstra.marked2 showSelectionWordCount -bool false

# Enable link popovers
defaults write com.brettterpstra.marked2 disablePopover -bool true

# Automatically validate URLs on update
defaults write com.brettterpstra.marked2 validateLinksOnLoad -bool true

# Style
###############################################################################

# Limit text width in Preview to
defaults write com.brettterpstra.marked2 limitTextWidth -bool false
defaults write com.brettterpstra.marked2 limitTextWidthPixels -int 900

# Auto-hyphenate in paragraphs
defaults write com.brettterpstra.marked2 autoHyphenate -bool false

# Prevent widows in headlines and paragraphs
defaults write com.brettterpstra.marked2 fixWidows -bool false

# Generate typographically correct quotes and punctuation (MultiMarkdown)
defaults write com.brettterpstra.marked2 noSmartyPants -bool true

# Surround footnote markers with square brackets (MultiMarkdown)
defaults write com.brettterpstra.marked2 footnoteBrackets -bool false

# Use APA Style
defaults write com.brettterpstra.marked2 outlineModeDefaultAPA -bool true

# Style verbatim (code) blocks as poetry
defaults write com.brettterpstra.marked2 codeIsPoetry -bool true

# Default preview style
# 0: Swiss
# 1: Antique
# 2: Mult-Column
# 3: GitHub
# 4: Amblin
# 5: Upstanding Citizen
# 6: Lopash
# 7: Manuscript
# 8: Grump
# 9: Custom CSS
defaults write com.brettterpstra.marked2 defaultPreviewStyle -int 3

# Track CSS changes
defaults write com.brettterpstra.marked2 trackCustomCSS -bool true

# Enabled MathJax
defaults write com.brettterpstra.marked2 includeMathJax -bool true

# Processor
###############################################################################

# Process Markdown with:
# MultiMarkdown
# Discount (GFM)
defaults write com.brettterpstra.marked2 isMultiMarkdownDefault -bool false
defaults write com.brettterpstra.marked2 defaultProcessor -string "Discount (GFM)"

# Generate IDs on headlines
defaults write com.brettterpstra.marked2 noLabels -bool true

# Use random footnote IDs
defaults write com.brettterpstra.marked2 randomFootnoteIDs -bool false

# Process Markdown inside of HTML
defaults write com.brettterpstra.marked2 processHTMLFiles -bool true

# Retain line breaks in paragraphs
defaults write com.brettterpstra.marked2 githubNewlines -bool true

# Render Github checkboxes
defaults write com.brettterpstra.marked2 convertGithubCheckboxes -bool true
