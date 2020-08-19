# Dispatch

## 🚀 Building the app

This project is built with `Xcode 12` in `Swift 5.2.4`.

Required:  
Xcode 11.6+ 

Dependencies: 
Project uses SPM to manage dependencies. All the dependencies should be checked out by Xcode automatically.

## 🛠 Tools
Following tools are not required to build/run but required for contributing to project. 

[SwiftLint](https://github.com/realm/SwiftLint).
Used  for enforcing coding style. To configure, update .swiftlint file in root directory.  

`$brew install swiftlint`

[Xcodegen](https://github.com/yonaskolb/XcodeGen) 
Used to generate Xcode project file using command line. This is not a hard dependency. Project file is checked-in. 

- Xcodegen helps in keeping directory structure true to the project.
- Reduces projects conflicts as project settings are configured outside xcodeproj file and part of git history.
- Building projects copies git hook to help in generating project file after git checkout.

`$brew install xcodegen`

