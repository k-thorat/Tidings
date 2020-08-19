#!/bin/sh

echo "--Start-- SwiftLint"
if which swiftlint >/dev/null; then
  swiftlint --config SwiftLint/.swiftlint.yml
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
echo "SwiftLint --End--"