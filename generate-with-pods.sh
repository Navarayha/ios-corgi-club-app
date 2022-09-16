#!/bin/bash

osascript -e 'tell app "Xcode" to quit'
rm -rf CorgiClubApp.xcodeproj
rm -rf CorgiClubApp.xcworkspace

if [ $# -eq 0 ]; then
  tuist generate CorgiClubApp -n
  sed -i '' "s/target '.*' do/target 'CorgiClubApp' do/g" Podfile
else
  tuist generate $1ExampleApp -n
  sed -i '' "s/target '.*' do/target '$1ExampleApp' do/g" Podfile
fi

pod install
xed CorgiClubApp.xcworkspace