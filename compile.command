#!/bin/bash

set -ex

# cd script dir
cd "$(dirname "$0")" || exit
cd ..

GIT_ROOT=$(pwd)

cd $GIT_ROOT/CheatManager
rm -rf CheatKit
git clone https://github.com/ProjectManticore/CheatKit.git
# clean last time build
rm -rf build *.ipa Payload .theos
cd CheatKit
make
cd ../
make
xcodebuild clean build CODE_SIGNING_ALLOWED=NO ONLY_ACTIVE_ARCH=NO CODE_SIGNING_REQUIRED=NO PRODUCT_BUNDLE_IDENTIFIER="com.manticore.CheatManager" -sdk iphoneos -scheme CheatManager -configuration Debug -derivedDataPath build
ln -sf build/Build/Products/Debug-iphoneos Payload
zip -r9 CheatManager.ipa Payload/CheatManager.app
