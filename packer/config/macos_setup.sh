#!/bin/zsh

# Homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
# Bazel
# brew install bazelisk
# Xcode
brew install xcodesorg/made/xcodes

export FASTLANE_SESSION
xcodes install \
--latest \
--experimental-unxip \
--use-fastlane-auth \
--no-superuser