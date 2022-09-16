#!/bin/bash

osascript -e 'tell app "Xcode" to quit'
rm -rf CorgiClubApp.xcodeproj
rm -rf CorgiClubApp.xcworkspace

rm Podfile



if [ $# -eq 0 ]; then
  tuist generate CorgiClubApp -n
else
  tuist generate $1ExampleApp -n
fi

ruby ./build_podfile.rb
pod install
xed CorgiClubApp.xcworkspace