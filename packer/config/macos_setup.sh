#!/bin/zsh

# Bazel installation
/opt/homebrew/bin/brew install bazelisk
# Xcodes tool installation
/opt/homebrew/bin/brew install xcodesorg/made/xcodes

xcode_version=15.4.0
# Xcode installation
export FASTLANE_SESSION
/opt/homebrew/bin/xcodes install \
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
sudo xcodebuild -runFirstLaunch
xcodebuild -downloadPlatform iOS
# Confirms runtime is installed
xcrun simctl runtime list
# Java installation
/opt/homebrew/bin/brew install openjdk
# Allows the plugin to find Java
echo 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"' >> ~/.zshenv
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshenv
# Solves the error 'Host key verification failed' when cloning
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# xcbeautify installation
/opt/homebrew/bin/brew install xcbeautify