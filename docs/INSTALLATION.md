## Installing Swift

### macOS

In order to use the Swift exercises, install Xcode version 10.0 or greater. On the first launch of Xcode, install the command line tools when prompted.

The current release version is available at the [Mac App Store](https://itunes.apple.com/us/app/xcode/id497799835?mt=12). 

Additional versions of Xcode (including the most recent beta) are available at [Apple's developer center](https://developer.apple.com/xcode/downloads/).

All exercises have been tested with Xcode 10.0 using Swift 4.2.

### Linux

The latest release is available on [Swift.org](https://swift.org/download/#releases).

Swift.org installation [instructions](https://swift.org/getting-started/#installing-swift).

## Editing the exercise file

In order to complete the exercise, you need to open an Xcode project and edit the source file. 

You can do this on the command line in Terminal by following these steps:

1. Change directories the exercise directory using the `cd` command. The full command should look similar to: `cd ~/exercism/swift/exercises/hello-world/` if you followed the default installation.

2. Create an Xcode project for the exercise, by typing: `swift package generate-xcodeproj`. When you run this command, Terminal prints out a statement similar to: `generated: ./HelloWorld.xcodeproj`.

3. Open the Xcode project by typing `open HellowWorld.xcodeproj`. Replace `HelloWorld` with the exercise you are currently working on. You'll find this name in Terminal in step 2.

4. In Xcode, in the left hand navigation, find the Sources folder. Open it and drill down until you find `HelloWorld.swift`. This is the file you need to edit to complete the exercise.

5. Make your edits in this file.
