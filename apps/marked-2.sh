#!/usr/bin/env bash

###############################################################################
# Marked 2
###############################################################################

# Show overview on launch
defaults write com.brettterpstra.marked2 showQuickOverviewOnLaunch -bool false

# High contrast preview
defaults write com.brettterpstra.marked2 inverseColors -bool true

# General
###############################################################################

# Keep new windows on top
defaults write com.brettterpstra.marked2 floatNewWindows -bool false

# Raise window on update
defaults write com.brettterpstra.marked2 raiseWindowOnUpdate -bool false

# Quit after closing last window
defaults write com.brettterpstra.marked2 terminateAfterLastWindowClosed -bool false

# Translucent in background
defaults write com.brettterpstra.marked2 transparentInBackground -bool false

# Background transparency level
defaults write com.brettterpstra.marked2 alphaLevel -float 0.75

# Disable memory-intensive features on large documents
defaults write com.brettterpstra.marked2 minimalJavaScript -bool true

# Show style picker
defaults write com.brettterpstra.marked2 showStylePicker -bool false

# Show work count
defaults write com.brettterpstra.marked2 showWordCount -bool true

# Word count excludes blockquotes
defaults write com.brettterpstra.marked2 excludeBlockQuotesFromCounts -bool true

# Word count excludes image captions
defaults write com.brettterpstra.marked2 excludeCaptionsFromCounts -bool true

# Word count excludes footnotes/citations
defaults write com.brettterpstra.marked2 excludeFootnotesFromCounts -bool true

# Word count excludes indented code blocks
defaults write com.brettterpstra.marked2 excludeVerbatimFromCounts -bool true

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

# Apps
###############################################################################

# Text editor
defaults write com.brettterpstra.marked2 externalEditor -string "Sublime Text"

# Edit new files automatically
defaults write com.brettterpstra.marked2 openNewFilesInEditor -bool false

# Links to text files should open in:
# 0: ask me each time
# 1: the current window
# 2: a new Marked window
# 3: their default application
# 4: reveal in Finder
# 5: edit in "Edit with" application
defaults write com.brettterpstra.marked2 mdLinkBehavior -int 5

# Image editor
defaults write com.brettterpstra.marked2 externalImageEditor -string "Preview"

# Proofing
###############################################################################

# Enable CriticMarkup automatically when syntax is detected
defaults write com.brettterpstra.marked2 shouldDetectCritic -bool true

# Minimum occurances to consider repeat
defaults write com.brettterpstra.marked2 minimumRepeats -int 3

# Export
###############################################################################

# Disable links/highlights when exporting PDF and Printing
defaults write com.brettterpstra.marked2 suppressPrintLinks -bool true

# Include URL as text annotation
defaults write com.brettterpstra.marked2 hrefAfterLinkTextforPrint -bool true

# Replace horizontal rules with page breaks
defaults write com.brettterpstra.marked2 hrIsPageBreak -bool true

# Allow page breaks in code blocks
defaults write com.brettterpstra.marked2 allowPageBreakInCode -bool true

# Embed images when copying HTML
defaults write com.brettterpstra.marked2 embedImagesInHTMLCopy -bool true

# Print background colors and images
defaults write com.brettterpstra.marked2 printBackgrounds -bool true

# Prevent orphaned headlines
defaults write com.brettterpstra.marked2 fixOrphans -bool true

# Add page breaks before H1
defaults write com.brettterpstra.marked2 h1IsPageBreak -bool false

# Exclude page break before first H1
defaults write com.brettterpstra.marked2 firstH1IsPageBreak -bool true

# Add page breaks before H2
defaults write com.brettterpstra.marked2 h2IsPageBreak -bool false

# Add page breaks before footnotes
defaults write com.brettterpstra.marked2 breakBeforeFootnotes -bool false

# Indicate page breaks in preview
defaults write com.brettterpstra.marked2 showPageBreaksInPreview -bool true

# Custom font size for export/print
defaults write com.brettterpstra.marked2 overrideBaseFontSize -bool true
defaults write com.brettterpstra.marked2 defaultPrintFontSize -float 10

# Header/footer font
defaults write com.brettterpstra.marked2 headerFooterFont -strong "Helvetica"

# Header/footer font size
defaults write com.brettterpstra.marked2 headerFooterFontSize -int 12

# Header and footer content
defaults write com.brettterpstra.marked2 printHeaderTopLeft -string ""
defaults write com.brettterpstra.marked2 printHeaderTopRight -string ""
defaults write com.brettterpstra.marked2 printHeaderBottomLeft -string ""
defaults write com.brettterpstra.marked2 printHeaderBottomRight -string "%page"

# Print header/footer on first page
defaults write com.brettterpstra.marked2 printHeaderFooterFirstPage -bool false

# Print border below header
defaults write com.brettterpstra.marked2 printBorderBelowHeader -bool true

# Print border above footer
defaults write com.brettterpstra.marked2 printBorderAboveFooter -bool true

# Print table of contents
defaults write com.brettterpstra.marked2 printTOC -bool false

# Page break after table of contents
defaults write com.brettterpstra.marked2 breakAfterTOC -bool false

# Print margins:
defaults write com.brettterpstra.marked2 topPrintMargin -float 30
defaults write com.brettterpstra.marked2 rightPrintMargin -float 30
defaults write com.brettterpstra.marked2 leftPrintMargin -float 30
defaults write com.brettterpstra.marked2 bottomPrintMargin -float 30

# Advanced
###############################################################################

# Strip MMD3 Metadata headers
defaults write com.brettterpstra.marked2 removeMetadataForPreview -bool true

# YAML Formatter: Remove before rendering
defaults write com.brettterpstra.marked2 removeYAMLHeaders -bool false

# YAML Formatter: Treat as MMD Meta
defaults write com.brettterpstra.marked2 convertYAMLToMMD -bool true

# Analyze readability statistics
defaults write com.brettterpstra.marked2 analyzeReadability -bool true

# Use system-wide Find pasterbaord
defaults write com.brettterpstra.marked2 useSystemFindPasteboard -bool true

# Use cmd-E for Find With Selection
defaults write com.brettterpstra.marked2 swapCommandE -bool false
