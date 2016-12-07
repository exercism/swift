## Xcode Tutorial

This guide explains how to create and configure an Xcode project for Exercism.

These instructions are written with the expectation that some readers will be very new to Xcode. Each step is described in excruciating detail. However, with a little experience performing these instructions should only take a minute.

_As far as housekeeping chores go, you are closer to the finish line than it appears._

### Create A New Xcode Project
![001-splash](https://cloud.githubusercontent.com/assets/5385825/20957611/c756745a-bc05-11e6-8631-e9e738ad464b.png)

Select macOS and Cocoa Application. (iOS Single View Application can also be used, but choosing macOS avoids the time needed to launch the iOS simulator each time a test is run.)

![002-templatechooser](https://cloud.githubusercontent.com/assets/5385825/20957613/c770da16-bc05-11e6-82e1-7da6c2ca6de0.png)

#### Name The Project
![003-nameproject](https://cloud.githubusercontent.com/assets/5385825/20957616/c7793828-bc05-11e6-8c73-bb02a71322b2.png)

1. Enter `Gigasecond` as the Product Name. This will become the name of the project. Note that any name can be used, but its helpful to avoid using punctuation such as hyphens, underscores, spaces, etc. _This walkthrough uses the `Gigasecond` exercise. For other exercises, replace the string `Gigasecond` with the exercise name._
2. Fill the Organization Name and Bundle Identifier with appropriate information. The Organization Name field will appear in each source file you create. The Bundle Identifier is not used in this context but should not be left blank.
3. The Language popup should be Swift, the Include Unit Tests checkbox should be selected. All other checkboxes should be deselected.

#### Save The Project
![004-saveproject](https://cloud.githubusercontent.com/assets/5385825/20957617/c77d5976-bc05-11e6-837d-1dacfe5e17c8.png)

1. Choose a location to save the project. Anyhwere will work, but a good choice is inside the root folder of the current exercise.
2. For example, the Exercism CLI will fetch an exercise into a folder named for the exercise. Typically that folder contains a readme file and a source file with unit tests. 
3. Create your project as shown in the above image. 
4. Once complete the files on disk should look like this (except we don't have a playground yet!):

![005-folderlayout](https://cloud.githubusercontent.com/assets/5385825/20957615/c77698d4-bc05-11e6-8117-7a7ec2fc035f.png)

### Configure The Project

The file inspector in Xcode does not correspond to the files on disk. At this point the project's file inspector should look similar to this:

![006-newprojectinitial](https://cloud.githubusercontent.com/assets/5385825/20957614/c77514f0-bc05-11e6-8514-4eec07736127.png)

Many of these files are unneeded, so let's move them out of the way.

Create a new group folder called 'Support' inside the main group and move the unused files into it. Compare the image below to the one above. As with many tasks in Xcode, there is a shortcut. In this case Command-Click to select all the unneeded files, and choose `File -> New -> Group from Selection` from the main menu or use the contextual menu.

![007-newprojectmidway](https://cloud.githubusercontent.com/assets/5385825/20957612/c769df04-bc05-11e6-9719-18b5aece0f2d.png)

Create a new playground document like in the image above. Although multiple menu choices are available, in order for this step to work properly use the main menu, `File -> New -> File...` (or Command-N) and choose Playground from the template chooser. (Other menu options tend to create the playground outside the project file.)

Once again in the image above, note the file `GigasecondTests.swift` inside the `GigasecondTests` folder. This file is unnecessary and can be deleted or moved somewhere else. Removing it is helpful because we are about to replace it with a new file of almost the same name.

#### Import The Exercism Tests Source File
![008-testsimportexample](https://cloud.githubusercontent.com/assets/5385825/20957618/c7800d4c-bc05-11e6-937f-de2f3743c1b6.png)

Right-Click (or Control-Click) on the `GigasecondTests` folder and choose Add Files to "Gigasecond" from the contextual menu to open a file import dialog box. Navigate to and select the unit tests file in the exercise folder. In this example the file is named `GigasecondTest.swift`. Different exercises may vary the name format somewhat.

Add the line `@testable import Gigasecond`. (If the Xcode project name contains a hyphen, replace it with an underscore. For example, with Word-count, enter `@testable import Word_count`). The red icons indicate failed tests or missing code objects, which is normal at this stage. Once imported correctly it should resemble the image above.

#### Make A New Source File For Your Code

Right-Click (or Control-Click) on the `Gigasecond` group folder and choose `New File`. Select macOS and Swift from the template chooser. The filename is up to you, but using the name of the exercise itself is a good starting point. It can be changed later. By convention Swift classes and structs begin with a capital letter, so their associated source files should as well. **Note this is the file you will submit to the Exercism web site for review.**

Housekeeping is finshed and Xcode is ready! Here is how the file inspector should look now:

![009-finallayoutexample](https://cloud.githubusercontent.com/assets/5385825/20957619/c7832748-bc05-11e6-9626-2f8a01fdcf22.png)

The playground is useful for drafting code snippets and playing with ideas.

`Gigasecond.swift` is the code file where you'll solve the exercise.

`GigasecondTest.swift` contains the tests provided by Exercism.

### Understanding How Tests Work

Each project has two targets, the application target, and the Unit Tests target. The source files for these targets appear in different groups (the yellow folders) in the Xcode file inspector. 

As part of the configuration in the previous section, you added a source file inside each group. 

The application source file is where you'll write the code needed to make the tests pass.

The tests source file was provided as part of the exercise. If in the course of solving the exercise you consider editing test source, stop, because you are missing something. The exercise can be solved with code in the application source file alone.

XCTestCase is the XCTest subclass that contains our test's methods and XCTAssert lines are the expected results, with different types depending on what you are testing. For more background on XCTest, see the More Information section below.

#### Running The Tests

You do not need to build and run the application. The tests can be run from the tests source file by clicking on one of the diamonds in the gutter of the document. The diamond next to the class definition will run all the tests, whereas the diamond next to each individuel test will run only that test.

Tests can also be invoked with Command-U, or from the Test Inspector (Command-5).

#### Getting Started

Add code to the application source file `Gigasecond.swift` to pass all the tests in the test suite.

_Spoiler Alert_ Want a hint for this exercise? Look at the test file. The first test is attempting to initialize an object named `Gigasecond` and assign it to the variable `gs`,  Because `Gigasecond` is not defined in the source file it is underlined in red. Inside the `Gigasecond.swift` file, add a new struct with the name `Gigasecond` and a failable initializer that takes one parameter, `from:` of type String. Add a var named `description` of type String. In the test file, the red underline beneath the `Gigsecond` call should disappear in a few seconds. Now you are on your way!

### Submission

1. In the Terminal, navigate to the folder that contains the application source file. In this example, the path would be `~/exercism/swift/gigasecond/Gigasecond/Gigasecond/`
2. To submit, type `Exercism submit Gigasecond.swift` (_Alternatively, you can submit by using the file name with the full path._)
3. Once uploaded, a URL will appear that reveals your solution on the Exercism web site.
4. The Exercism CLI allows files to be submitted more than once, and each successive iteration will be added alongside the original.

### More Information

You can learn more about Test Driven Development, XCTAssert Methods and XCTesting here. Unfortunately these sources mostly have not been updated to Swift 3 and Xcode 8, but they still contain a lot of useful information.

[Apple's Guide on XCTest](https://developer.apple.com/library/tvos/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/02-quick_start.html#//apple_ref/doc/uid/TP40014132-CH2-SW1)


[XCTest​Case / XCTest​Expectation / measure​Block()](http://nshipster.com/xctestcase/)

[Getting Started with TDD in Swift 2.0](https://medium.com/@ynzc/getting-started-with-tdd-in-swift-2fab3e07204b#.589p6ao6y)
