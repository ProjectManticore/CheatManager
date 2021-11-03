#!/bin/bash

set -ex

# add /opt/bin to search path
export PATH=/opt/homebrew/bin/:$PATH
# add /theos to search path
export PATH=/theos:$PATH
# cd script dir
cd "$(dirname "$0")" || exit
cd ..

GIT_ROOT=$(pwd)

cd $GIT_ROOT/CheatManager
# clean last time build
rm -rf build *.ipa Payload
make

xcodebuild clean build CODE_SIGNING_ALLOWED=NO ONLY_ACTIVE_ARCH=NO CODE_SIGNING_REQUIRED=NO PRODUCT_BUNDLE_IDENTIFIER="com.manticore.CheatManager" -sdk iphoneos -scheme CheatManager -configuration Debug -derivedDataPath build
ln -sf build/Build/Products/Debug-iphoneos Payload
zip -r9 CheatManager.ipa Payload/CheatManager.app
