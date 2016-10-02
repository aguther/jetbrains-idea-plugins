#!/usr/bin/env bash

# remove output directory
rm -rf ./build &>/dev/null

# build all plugins
./invoke.sh "./gradlew clean buildRpm"

# create directory
mkdir -p ./build &>/dev/null

# copy rpms
find . -name "*.rpm" -exec cp {} ./build \; &>/dev/null
