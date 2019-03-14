# xSwift

[Exercism](http://exercism.io) exercises in Swift

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data)

## Swift Track

We use Travis CI to automatically run all the unit tests on the code that is going to be checked in. In addition we also have [SwiftLint](https://github.com/realm/SwiftLint) set up to make sure that the code is consistent across all exercises. Please run `swiftlint autocorrect --format` on your code before submitting a PR. Check the travis file to see which version of swift we are testing against. Make sure all the tests pass locally using the swift package manager. Keep in mind that we support Linux so the tests need to also pass on linux on Travis. 

## Create an Xcode Project

`swift package generate-xcodeproj` creates an Xcode project from the current directory. Please see the [Exercism Swift Testing](https://exercism.io/tracks/swift/tests) page for details.
