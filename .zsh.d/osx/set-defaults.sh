# Sets reasonable OS X defaults.
#
# Or, in other words, set shit how I like in OS X.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Run ./set-defaults.sh and you'll be good to go.
set -e

# Disable App Quarantine feature so you can run apps you download
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder
chflags nohidden ~/Library

# Set a really fast key repeat
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

# Disable autocorrect
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Enable tap to click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
defaults write -g com.apple.mouse.tapBehavior -int 1

# Show drives All
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

# Empty trash securely
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Show warning before empty trash
defaults write com.apple.finder WarnOnEmptyTrash -bool true

# Show warning before changing extensions
defaults write com.apple.finder WarnOnEmptyTrash -bool true

# Show filenames extensions
defaults write com.apple.finder AppleShowAllExtensions -bool true

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Enable Autohide dock
defaults write com.apple.dock autohide -bool true

# Run the screensaver if we're in the bottom-left hot corner
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Ensure Dock icon size
defaults write com.apple.dock tilesize -int 36

# Sets dock icon magnification
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 80

# Sets the dock position
defaults write com.apple.dock orientation -string right

# Define action for hot corner
defaults write com.apple.dock wvous-tl-corner -int 4
defaults write com.apple.dock wvous-tl-modifier -int 0

defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0

defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Hide Safari's bookmark bar
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write -g WebKitDeveloperExtras -bool true

# Disable creation of .DS_Store files on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

/usr/bin/killall Dock
