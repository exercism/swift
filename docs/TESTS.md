## Testing Tutorial

This guide explains how to run unit tests for the Exercism Swift exercises using either macOS or Linux.

### For experienced users:
	1. `swift test` runs tests
	2. `swift package generate-xcodeproj` creates an Xcode project
	
To run the tests from the command line, first `cd` to the directory for an exercise (for example, ~/exercism/swift/exercises/hello-world/), then execute `swift test`. This will compile the files in the Sources directory and execute the tests in the Tests directory. Alternatively, open the Xcode project and press Command-U.

### Overview

The following instructions are written with the expectation that some readers will be very new to test driven development, Exercism, or Xcode. Each step is described in detail.

**macOS users are encouraged to use Xcode.** The Xcode environment provides detailed error messages compared to those available from the command line.

Exercism uses the [Swift Package Manager](https://github.com/apple/swift-package-manager/tree/master/Documentation) to package files and tests for Swift. Packages provide a complete set of source files that can be compiled and executed from the command line.

To complete an Exercism exercise, you will work primarily with two files:

* **Swift Source** (hello-world/Sources/HelloWorld.swift). This is the code file you will submit to Exercism.
* **Test Source** (hello-world/Tests/HelloWorldTests/HelloWorldTest.swift). This file is provided by Exercism which contains the XCTestCase subclass that defines the solution to the exercise. You never edit this file, but you will have to understand it in order to fulfill its expectations.

Optionally, Xcode can create a third file for experimentation:

* **Playground** (MyPlayground.playground) is a scratchpad for drafting code snippets and playing with ideas. The code executes as you type, providing instant feedback.


### Configuring Xcode
1. `cd` to the directory for an exercise (for example, ~/exercism/swift/exercises/hello-world/), then execute `swift package generate-xcodeproj` in the Terminal. This creates an Xcode project in the current directory with the same name as the package. (The generated project file is ideal for unit tests, as it does not include overhead such as launching the iOS simulator or a target application.)
2. Open the newly generated project file.
3. At this point the project's file inspector should look similar to the following image. If the `HelloWorldTests` folder is closed, click on the disclosure triangle to reveal its contents.
4. The items Package.swift, Configs, and Products are boilerplate that do not need modification.

![file inspector](/docs/img/file-inspector.png)

### Running Tests with Xcode

Select the test file from the file inspector. You can trigger tests by clicking on one of the diamonds in the gutter of the Tests Source file. The diamond next to the class definition will run all the tests, whereas the diamond next to each individual test will run only that test.

![tests](/docs/img/tests.png)

Tests can also be invoked with Command-U, from the Test Inspector (Command-5), or from the sub-menu under the play button in the top bar. Red errors are normal at this stage.

![failing tests](/docs/img/tests-fail.png)

Once all the tests are marked with a green icon, congratulations, you have successfully completed the exercise! Now submit it to the Exercism website for review. If you are impossibly stuck, submit the exercise before it is complete to view how other users solved the exercise.

![passing tests](/docs/img/tests-pass.png)

*The Hello-World exercise is a very simple coding problem, but the complexity of Xcode can make even simple exercises complex. We can ignore most of this complexity, because we only need to edit one file. You can always regenerate the Xcode project if something goes wrong.*

### Xcode Playgrounds

Playgrounds can be useful for brainstorming solutions to the problem. The playground continuously evaluates code as you type, displaying variable states and results as you type.

If you generated an Xcode project, follow these steps:

1. First, make sure to select the topmost item in the File Inspector, the item marked with a blue icon that represents the project file.
2. Press Command-N and choose Playground from the template chooser. Click Next, and click Create.

Keep in mind that while playgrounds are useful for drafting code snippets and ideas, code must be moved to the Swift Source file for testing and submission.

### How Tests Are Used

Test driven development is a very iterative process. The first step is to successfully run the tests and have them fail. Remember that the exercise can be solved with code in the application source file alone. Enter your solution into the Swift Source file. Xcode will continuously update the display with errors that highlight code that will not compile.

One approach begins with "sliming a test" by creating a method that returns a correct hard coded value. Sliming will confirm the project can compile and pass one test. Next, replace the hard coded value with code that generates the expected return value and test again. Keep repeating this cycle until all the tests pass.

## Submission

1. In the Terminal, navigate to the folder that contains the application source file. In this example, the path would be `~/exercism/swift/hello-world/HelloWorld/HelloWorld/`
2. To submit, type `exercism submit HelloWorld.swift` (_Alternatively, you can submit by using the file name with the full path from any directory. A second alternative is to locate the file you need to submit in the Finder. Open the Terminal, type exercism submit followed by a space, then drag the file from the Finder into the Terminal and press return._)
3. Once uploaded, a URL will appear that reveals your solution on the Exercism web site.
4. The Exercism CLI allows files to be submitted more than once, and each successive iteration will be added alongside the original.

To review:

* **HelloWorld.swift** is the Swift Source code file where you code the solution and later submit it to Exercism.
* **HelloWorldTest.swift** is the Test Source code file provided by Exercism. It contains the tests that define the exercise.
* **MyPlayground.playground** is for drafting code snippets and playing with ideas.

### Participate in Code Reviews

After you submit a file, follow the URL presented to show the submission on the web. Bookmark it for future reference. From your submission page you can view how others solved the same problem.

### More Information

XCTestCase is the XCTest subclass that contains the test's methods and XCTAssert lines are the expected results. The results are different types depending on how the test is designed.

There is a lot more to learn more about Test Driven Development, XCTAssert Methods and XCTestCase. Unfortunately up-to-date Swift documentation on these topics is short-lived. Although out of date as of when this tutorial was last updated, this list of sources contains useful information:

[Apple's Guide on XCTest](https://developer.apple.com/library/tvos/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/02-quick_start.html#//apple_ref/doc/uid/TP40014132-CH2-SW1)

[XCTest​Case / XCTest​Expectation / measure​Block()](http://nshipster.com/xctestcase/)

A list of [Assertions supported in XCTest](http://rshankar.com/assertions-supported-in-xctest/).

[Getting Started with TDD in Swift 2.0](https://medium.com/@ynzc/getting-started-with-tdd-in-swift-2fab3e07204b#.589p6ao6y)

