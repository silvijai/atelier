#!/usr/bin/env zsh
set -euo pipefail

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock orientation -string left
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock mru-spaces -bool false

# Finder
defaults write com.apple.finder AppleShowAllExtensions -bool true
defaults write com.apple.finder FXPreferredViewStyle -string clmv
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder AppleShowAllFiles -bool true

# General UI and keyboard repeat
defaults write NSGlobalDomain AppleInterfaceStyle -string Dark
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Screenshot location
mkdir -p "$HOME/Pictures/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"

# Turn off system audio volume, like boot sounds
sudo nvram SystemAudioVolume=%80

# Spaces and login screen
defaults write com.apple.spaces spans-displays -bool false
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

killall Dock
killall Finder
killall SystemUIServer 2>/dev/null || true
