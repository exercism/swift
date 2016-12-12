## Xcode Tutorial

This guide explains how to create and configure a Swift-based Xcode project for Exercism.

Apple does not support user-defined project templates in Xcode, and the default templates are more elaborate than what is needed for Exercism. This guide bridges that gap.

These instructions are written with the expectation that some readers will be very new to Xcode. Therefore each step is described in excruciating detail. However, after a few projects, setting up a fresh project should only take a minute.

_As far as housekeeping chores go, you are closer to the finish line than it appears._

###Overview

To complete an Exercism exercise, you will work primarily with three files:

* **Swift Source** (HelloWorld.swift). This is the file you will create to hold your source code and it is the file you will submit to Exercism.
* **Test Source** (HelloWorldTest.swift). This file is provided by Exercism. It contains the XCTestCase subclass that defines the solution to the exercise. You never edit this file, but you will have to understand it in order to fulfill its expectations. This is also the file where you will trigger the tests and interpret the results.
* **Playground** (MyPlayground.playground) is a scratchpad for drafting code snippets and playing with ideas. The code executes as you type, providing instant feedback.

When you reach the end of this tutorial, the file inspector in Xcode will look like this.

![011-finalLayoutExample](file:///Users/bd/Developer/Tower/xcswift/img/docs/tests/011-finalLayoutExample.png)

### Create A New Xcode Project

![001-splash](file:///Users/bd/Developer/Tower/xcswift/img/docs/tests/001-splash.png)

1. Choose the second item in the list shown above to create a new project, or press Command-Shift-N.
2. Select macOS from the row of buttons at the top of the dialog, then choose the Cocoa Application icon as shown in this image:

![002-templatechooser](file:///Users/bd/Developer/Tower/xcswift/img/docs/tests/002-templateChooser.png)

#### Name The Project
![003-nameproject](file:///Users/bd/Developer/Tower/xcswift/img/docs/tests/003-nameProject.jpg)

1. Enter `HelloWorld` as the Product Name for the project. Spaces and some punctuation symbols are acceptable, but it is better to avoid them early on. _For other exercises, replace the string `HelloWorld` with the exercise name._
2. Fill in the Organization Name and Bundle Identifier. The Organization Name field will appear in each source file you create. The Bundle Identifier is not used in this context but should not be left blank.
3. The Language popup should be Swift, the Include Unit Tests checkbox should be selected. All other checkboxes should be deselected.

#### Save The Project
![004-saveproject](file:///Users/bd/Developer/Tower/xcswift/img/docs/tests/004-saveProject.jpg)

1. Choose a location to save the project. Anywhere is fine, but a good choice is inside the root folder of the current exercise.
2. In this example, the Exercism CLI fetched an exercise into a newly created root folder named `hello-world`. The fetched contents include a readme file `README.md` and a Test Source file `HelloWorldTest.swift`. 
3. Create your project as shown in the above image, inside the root folder `hello-world`. 
4. The contents displayed inside the Xcode File Inspector do not match the arrangement of the files on the disk. This is confusing at first, but it makes sense as projects become more complex. You will need a general idea of how the layout is different in order to import files later in this tutorial. If you switch to the Finder to explore the file hierarchy now, the files on disk should look like the image below. Essentially Xcode added a new project folder named `HelloWorld` (highlighted) to the root folder `hello-world`.

![005-folderlayout](file:///Users/bd/Developer/Tower/xcswift/img/docs/tests/005-folderLayout.png)

#### Configure the Initial Files in the Project

At this point the project's file inspector should look similar to the image on the left. If the `HelloWorldTests` folder is closed, click on the disclosure triangle to reveal its contents. Many of these files are not needed, so let's move them out of the way.

![006-newprojectinitial](file:///Users/bd/Developer/Tower/xcswift/img/docs/tests/006-newProjectInitial.jpg)

1. Create a new group folder 'Support' inside the main group then drag the unused files into it. As with many tasks in Xcode, there is a shortcut. In this case you could also Command-Click to select all the unneeded files, and choose `File -> New -> Group from Selection` from the contextual menu.
2. Look at the image above on the right, note the file `HelloWorldTests.swift`. This file was provided by Xcode. Because Exercism supplies its own test file - often with a similar name - the default Xcode file is unnecessary and should be deleted. To delete the file, select it in the File Inspector and press the Delete key. In the confirmation dialog that appears, move the file to the trash.
3. Next, create a new playground document. First, make sure to select the topmost item in the File Inspector, the item marked with a blue icon that represents the project file.
4. Xcode provides several different options to create a new playground, including one called New Playground. However, in order for this step to work properly follow this exactly: press Command-N and choose Playground from the template chooser. Click Next, and click Create.

At this stage, the File Inspector should appear like this:

![007-fileInspectorUpdate](file:///Users/bd/Developer/Tower/xcswift/img/docs/tests/007-fileInspectorUpdate.png)

#### Make A New Swift Source File For Your Code

![008-templateChooserSwift](file:///Users/bd/Developer/Tower/xcswift/img/docs/tests/008-templateChooserSwift.png)

1. Press Command-N to open the template chooser. Select macOS the Swift File icon, as shown above. 
2. Near the bottom of the Save As dialog that appears next, set the Group to `HelloWorld` and select only `HelloWorld` from the Targets list.
3. The filename is up to you and can be changed later. The project name, `HelloWorld`, is a good first choice. By convention Swift classes and structs begin with a capital letter, so their source files should as well.
4. Click Create. **Note this is the file you will submit to the Exercism web site for review.**

*Xcode note: If the file appeared in the wrong place, drag it into its preferred position.*

#### Import The Exercism Test Source File

In the Finder, locate the root folder `hello-world` for this exercise. Drag the file `HelloWorldTests.swift` into the File Inspector so that it inserts into the `HelloWorldTests` group. When the import dialog appears, it should be set up like this:

![009-importTestSource](file:///Users/bd/Developer/Tower/xcswift/img/docs/tests/009-importTestSource.png)

Select the newly imported file in the File Inspector to open the source code. Add the line `@testable import HelloWorld` above the class declaration. (When the Xcode project name contains a hyphen, replace it with an underscore. (For example, `Word-Count` would become `Word-Count`) The image below shows how the document should appear. Red errors are likely at this stage, and normal.

![010-testsImportExample](file:///Users/bd/Developer/Tower/xcswift/img/docs/tests/010-testsImportExample.png)

Here is how the file inspector should look now:

![011-finallayoutexample](file:///Users/bd/Developer/Tower/xcswift/img/docs/tests/011-finalLayoutExample.png)

The housekeeping is finished and Xcode is ready! To review:

* **HelloWorld.swift** is the Swift Source code file where you code the solution and later submit it to Exercism.
* **HelloWorldTest.swift** is the Test Source code file provided by Exercism. It contains the tests that define the exercise.
* **MyPlayground.playground** is for drafting code snippets and playing with ideas.

### How Tests Are Used

Test driven development is a very iterative process. The first step is to successfully run the tests (see the next section), and have them fail. Remember that the exercise can be solved with code in the application source file alone. Enter your solution into the Swift Source file. As you type, Xcode will continuously update the display with errors that highlight code that will not compile.

One approach begins with creating a method that returns a correct hard coded value to at least the first test in order for the project to compile. This should confirm that Xcode is passing values between the code and tests properly. Next, create code that generates the expected return value and test again. Keep repeating this basic cycle until all the tests pass.

#### Running The Tests

Trigger a test by clicking on one of the diamonds in the gutter of the Tests Source file. The diamond next to the class definition will run all the tests, whereas the diamond next to each individual test will run only that test.

Tests can also be invoked with Command-U, or from the Test Inspector (Command-5).

Once all the tests are marked with a green icon, congratulations, you have successfully completed the exercise! Now submit it to the Exercism website for review. If you are impossibly stuck, submit the exercise before it is complete to view how other users solved the exercise.

*The Hello-World exercise is a very simple coding problem, but the complexity of Xcode can make even simple exercises challenging. If creating a working solution is problematic, the issue may be with how the project is configured. Consider submitting the unfinished exercise to obtain a solution. Then try repeating this tutorial from the beginning with a fresh Xcode project.*

### Submission

1. In the Terminal, navigate to the folder that contains the application source file. In this example, the path would be `~/exercism/Swift/hello-world/HelloWorld/HelloWorld/`
2. To submit, type `exercism submit HelloWorld.swift` (_Alternatively, you can submit by using the file name with the full path from any directory. A second alternative is to locate the file you need to submit in the Finder. Open the Terminal, type exercism submit followed by a space, then drag the file from the Finder into the Terminal and press return._)
3. Once uploaded, a URL will appear that reveals your solution on the Exercism web site.
4. The Exercism CLI allows files to be submitted more than once, and each successive iteration will be added alongside the original.

### Participate in Code Reviews

After you submit a file, follow the URL presented to show the submission on the web. Bookmark it for future reference. From your submission page you can view how others solved the same problem.

### More Information

XCTestCase is the XCTest subclass that contains the test's methods and XCTAssert lines are the expected results. The results are different types depending on how the test is designed.

There is a lot more to learn more about Test Driven Development, XCTAssert Methods and XCTestCase. Unfortunately up-to-date Swift documentation on these topics is short-lived. Although out of date as of when this tutorial was last updated, this curated list of sources contains useful information:

[Apple's Guide on XCTest](https://developer.apple.com/library/tvos/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/02-quick_start.html#//apple_ref/doc/uid/TP40014132-CH2-SW1)

[XCTest​Case / XCTest​Expectation / measure​Block()](http://nshipster.com/xctestcase/)

A list of [Assertions supported in XCTest](http://rshankar.com/assertions-supported-in-xctest/).

[Getting Started with TDD in Swift 2.0](https://medium.com/@ynzc/getting-started-with-tdd-in-swift-2fab3e07204b#.589p6ao6y)

