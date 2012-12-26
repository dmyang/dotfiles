# disable 3D dock
defaults write com.apple.dock no-glass -bool true

# disable Time Machine
sudo tmutil disablelocal

# un-hide Library folder
chflags nohidden ~/Library

# disable resume
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# speed up key repeat
defaults write NSGlobalDomain KeyRepeat -int 0

# disable DS files on network stores
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# disable window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# disable press and hold
defaults write -g ApplePressAndHoldEnabled -bool false

# enable spring load on dock
defaults write enable-spring-load-actions-on-all-items -bool true

# enable all keys in dialogs
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# expand save dialogs
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# expand print dialogs
defaults write -g PMPrintingExpandedStateForPrint -bool true

# disable 3D dock
defaults write com.apple.dock no-glass -boolean YES

# disable autocorrect
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
