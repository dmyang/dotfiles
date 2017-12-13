#!/usr/bin/env sh

### SYSTEM ###

# un-hide Library folder
chflags nohidden ~/Library

# disable Time Machine
sudo tmutil disable

# disable resume
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

### KEYBOARD ###

# speed up key repeat
defaults write NSGlobalDomain KeyRepeat -int 2

# shorten initial repeat delay
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# disable press and hold
defaults write -g ApplePressAndHoldEnabled -bool false

### ANIMATIONS ###

# instant expose
defaults write com.apple.dock expose-animation-duration -int 0
defaults write com.apple.dock springboard-show-duration -int 0
defaults write com.apple.dock springboard-hide-duration -int 0

# disable window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

### DOCK ###

# enable spring load on dock
defaults write enable-spring-load-actions-on-all-items -bool true

# scale effect
defaults write com.apple.dock mineffect -string scale

# disable autocorrect
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

### DIALOGS ###

# enable all keys in dialogs
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# expand save dialogs
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# expand print dialogs
defaults write -g PMPrintingExpandedStateForPrint -bool true

### RESET DOCK ###

killall Dock
