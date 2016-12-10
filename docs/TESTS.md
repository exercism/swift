## Xcode Tutorial

This guide explains how to create and configure an Xcode project for Exercism.

IMPORTANT: The first exercise in the Swift language track, Hello-World, is used in this example. Hello-World is unique compared to other exercises: it includes a starter Xcode project preconfigured with a single test target. This bare bones project is an affordance for experienced Xcode developers. 

Apple does not provide a facility in Xcode for user-defined project templates, and the preconfigured templates are more elaborate than necessary for coding exercises. Xcode changes often, making starter projects a challenge. This guide bridges that gap.

These instructions are written with the expectation that some readers will be very new to Xcode. Each step is described in excruciating detail. However, with practice setting up a fresh project should only take a minute.

_As far as housekeeping chores go, you are closer to the finish line than it appears._

###Overview

To complete an Exercism exercise, you will work primarily with three files:

* **PlayGround** (MyPlayground.playground) is for drafting code snippets and playing with ideas. The code executes as you type, providing instant feedback.
* **Swift Source** (HelloWorld.swift). This is where you code the solution; it is the file you will submit to Exercism.
* **Test Source** (Hello-WorldTests.swift). This file is provided by Exercism. It contains the tests that define the solution to the exercise. You never edit this file, but you will have to understand it in order to fulfill its expectations. This is also the file where you will trigger the tests and interpret the results.

When you reach the end of this tutorial, the file inspector in Xcode will look like this.

![009-finallayoutexample](/img/docs/tests/009-finalLayoutExample.png)

### Create A New Xcode Project
![001-splash](/img/docs/tests/001-splash.png?raw=true)

Select macOS from the row of buttons at the top of the dialog, then choose the Cocoa Application icon as shown in this image: 

![002-templatechooser](/img/docs/tests/002-templateChooser.png?raw=true)

#### Name The Project
![003-nameproject](/img/docs/tests/003-nameProject.png?raw=true)

1. Enter `Hello-World` as the Product Name to name the project. _For other exercises, replace the string `Hello-World` with the exercise name._
2. Fill in the Organization Name and Bundle Identifier. The Organization Name field will appear in each source file you create. The Bundle Identifier is not used in this context but should not be left blank.
3. The Language popup should be Swift, the Include Unit Tests checkbox should be selected. All other checkboxes should be deselected.

#### Save The Project
![004-saveproject](/img/docs/tests/004-saveProject.png?raw=true)

1. Choose a location to save the project. Anywhere will work, but a good choice is inside the root folder of the current exercise.
2. For example, the Exercism CLI will fetch an exercise into a folder named for the exercise. Typically that folder contains a readme file and a Test Source file. 
3. Create your project as shown in the above image. 
4. Once complete the files on disk should look like the image below. Essentially it added a new folder to the root folder named Hello-World (highlighted in this example), which contains the entire Xcode project.

![005-folderlayout](/img/docs/tests/005-folderLayout.png?raw=true)

### Configure The Project

At this point the project's file inspector should look similar to the image on the left. (Note that items in file inspector do not correspond to the files on disk.) Many of these files are not needed, so let's move them out of the way so that Xcode matches the image on the right. If you are new to Xcode, step by step instructions continue below.

![006-newprojectinitial](/img/docs/tests/006-newProjectInitial.png?raw=true)

Create a new group folder 'Support' inside the main group then drag the unused files into it. As with many tasks in Xcode, there is a shortcut. In this case you could also Command-Click to select all the unneeded files, and choose `File -> New -> Group from Selection` from the contextual menu as shown below:

![007-newGroupFromSelection](/img/docs/tests/007-newGroupFromSelection.png?raw=true)

Next, create a new playground document as shown in the righthand image below.

Xcode provides several different menus that will accomplish this task, but in order for this step to work properly use the main menu, `File -> New -> File...` (or Command-N) and choose Playground from the template chooser. (Other menu options will create the playground outside the project file.)

![006-newprojectinitial](/img/docs/tests/006-newProjectInitial.png?raw=true)

Once again in the file inspector image on the left, note the file `Hello-WorldTests.swift` that Xcode provided inside the `Hello-WorldTests` folder. This file is unnecessary and should be deleted. The Exercism files tend to use an identical or similar name to the boilerplate file provided by Xcode. Deleting it will avoid confusion.

#### Import The Exercism Test Source File

Right-Click (or Control-Click) on the `Hello-WorldTests` folder and choose `Add Files to "Hello-World"` from the contextual menu. A file import dialog box will appear. Navigate to and select the Tests Source file (`helloWorldTest.swift`) in the exercise folder. Usually the test will be in the root folder, but in this one case you may have to dig it out of `swift\hello-world\helloWorldTest\helloWorldTest.swift`.

Add the line `@testable import Hello_World`. (When the Xcode project name contains a hyphen, replace it with an underscore.) The image below shows what the document may look like after import. Red is likely, and normal. Here the red icons indicate failed tests. In other exercises some of the code itself might be underlined in red, which usually means missing code objects. Red is your main clue, once you interpret what the red is complaining about, you can write code that will make it disappear.

![008-testsimportexample](/img/docs/tests/008-testsImportExample.png?raw=true)

#### Make A New Source File For Your Code

Right-Click (or Control-Click) on the `Hello-World` group folder and choose `New File`. Select macOS and Swift from the template chooser. The filename is up to you, but often  the Source Test file will suggest a good starting point. It can always be changed later. By convention Swift classes/structs begin with a capital letter, so their associated source files should as well. **Note this is the file you will submit to the Exercism web site for review.**

Here is how the file inspector should look now:

![009-finallayoutexample](/img/docs/tests/009-finalLayoutExample.png?raw=true)

The housekeeping is finished and Xcode is ready! To review:

* **MyPlayground.playground** is for drafting code snippets and playing with ideas.
* **HelloWorld.swift** is where you code the solution and later submit it to Exercism.
* **Hello-WorldTests.swift** is the file provided by Exercism that you imported. It contains the tests that define the next task.

### Understanding How Tests Work

The exercise can be solved with code in the application source file alone. As you type,  Xcode will continuously update the display with errors that highlight code that will not compile. 

Once you have refined your code to eliminate all the errors, that doesn't mean the exercise if finished! 

The next step is the foundation of test driven development: test your syntactically correct code to confirm that it is computing correct answers, as described in the next section.

#### Running The Tests

You do not build and run the application. Trigger a test by clicking on one of the diamonds in the gutter of the Tests Source file. The diamond next to the class definition will run all the tests, whereas the diamond next to each individual test will run only that test.

Tests can also be invoked with Command-U, or from the Test Inspector (Command-5).

Once all the tests are marked with a green icon, congratulations, you have successfully completed the exercise! Now it is time to submit it to the Exercism website. If you are impossibly stuck, submit the exercise before it is complete to view the solutions.

### Submission

1. In the Terminal, navigate to the folder that contains the application source file. In this example, the path would be `~/exercism/swift/hello-world/Hello-World/Hello-World/HelloWorld.swift`
2. To submit, type `Exercism submit HelloWorld.swift` (_Alternatively, you can submit by using the file name with the full path._)
3. Once uploaded, a URL will appear that reveals your solution on the Exercism web site.
4. The Exercism CLI allows files to be submitted more than once, and each successive iteration will be added alongside the original.

### Participate in Code Reviews

Follow the URL presented when you submit a file to show the submission on the web. Bookmark it for future reference. 

From the link you can see comments left by other programmers. You can also ask for help and see how others solved the same problem. Few programmers will solve any exercise in exactly the same way, and there is something to learn even from minor differences between versions of the same solution.

### More Information

XCTestCase is the XCTest subclass that contains our test's methods and XCTAssert lines are the expected results, with different types depending on what you are testing. Additional detail can be found on XCTest in the resources listed below.

There is a lot more to learn more about Test Driven Development, XCTAssert Methods and XCTesting. Unfortunately up to date documentation on these topics is rare. Although out of date as of when this tutorial was last updated, these sources contain a lot of useful information:

[Apple's Guide on XCTest](https://developer.apple.com/library/tvos/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/02-quick_start.html#//apple_ref/doc/uid/TP40014132-CH2-SW1)

[XCTest​Case / XCTest​Expectation / measure​Block()](http://nshipster.com/xctestcase/)

A list of [Assertions supported in XCTest](http://rshankar.com/assertions-supported-in-xctest/).

[Getting Started with TDD in Swift 2.0](https://medium.com/@ynzc/getting-started-with-tdd-in-swift-2fab3e07204b#.589p6ao6y)
