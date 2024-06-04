#!/bin/zsh

source demo.env

cd $REPO_URL
bazel test --test_output=all //app/...
