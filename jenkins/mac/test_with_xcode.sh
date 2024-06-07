#!/bin/zsh

source demo.env

cd $REPO_URL
cd app

NSUnbufferedIO=YES xcodebuild test \
    -scheme Demo \
    -project Demo.xcodeproj \
    -sdk iphonesimulator \
    -destination "platform=iOS Simulator,id=$SIM_ID" 2>&1 | xcbeautify
