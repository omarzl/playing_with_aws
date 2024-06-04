#!/bin/zsh

sim_name="Demo"
create_output=$(xcrun simctl create $sim_name com.apple.CoreSimulator.SimDeviceType.iPhone-15-Pro)
simulator_id=$(echo $create_output | tail -1)

echo "SIM_ID=$simulator_id" >> demo.env
