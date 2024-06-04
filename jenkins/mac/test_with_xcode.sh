#!/bin/zsh

source demo.env

cd $REPO_URL
cd app

xcodebuild test \
    -scheme Demo \
    -project Demo.xcodeproj \
    -sdk iphonesimulator \
    -destination "platform=iOS Simulator,id=$SIM_ID"
