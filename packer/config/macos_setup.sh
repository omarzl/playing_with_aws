#!/bin/zsh

# Homebrew installation
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
# Bazel installation
brew install bazelisk
# Xcodes tool installation
brew install xcodesorg/made/xcodes

xcode_version=15.4.0
# Xcode installation
export FASTLANE_SESSION
xcodes install \
$xcode_version \
--experimental-unxip \
--use-fastlane-auth \
--no-superuser
# Selects Xcode
sudo xcode-select -s /Applications/Xcode-$xcode_version.app
# Confirms Xcode selection
xcode-select -p
# Initial setup
sudo xcodebuild -license accept
xcodebuild -runFirstLaunch
xcodebuild -downloadPlatform iOS
