### Creating the project in Xcode

These steps will use the `bob` exercise as an example. If you are not working on `bob`, replace `bob` with your exercise name in the steps below.

* Start Xcode create a new project.
* Select iOS-->Application and then Single View Application and click Next.
* Enter `Bob` as your Product Name, set the language to Swift and then click Next.
* Accept the default settings for the remaining screens and finish creating your project.
* You will see two targets in your project, one for the application named `Bob` and one for tests named `BobTests`. If you chose to create an OSX application instead of an iOS application, you will not see a `BobTests` target and will have to create it manually.
* In the `BobTests` target, open the file named `BobTests.swift` replace the contents with the test file you got from exercism.
* Add a new file to the `Bob` target folder and name it `Bob.swift`.
* Select `Bob.swift` and in the File Inspector make sure that both `Bob` and `BobTests` are checked in the Target Membership area.
* Now use CMD-U to run the tests, and happy coding!

### Recommended Learning Resources

Information about the Swift programming language, including instructional videos, sample code and language manuals can be found at [Apple's Swift Programming Language page](https://developer.apple.com/swift/).
