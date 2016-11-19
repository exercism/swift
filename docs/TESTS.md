### Creating the project in Xcode

Please see <a href="https://developer.apple.com/library/tvos/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/02-quick_start.html#//apple_ref/doc/uid/TP40014132-CH2-SW1" target="_blank">Apple's guide on XCTest</a>

These steps will use the `bob` exercise as an example. If you are not working on `bob`, replace `bob` with your exercise name in the steps below.

* Select iOS-->Application and then Single View Application and click Next.

* Enter `bob-swift`* as your Product Name, set the language to Swift, and check "Include Unit Tests", and then click Next.

* Save the project in the same folder as the Exercism test file:

![screen shot 2016-02-29 at 1 50 17 pm](https://cloud.githubusercontent.com/assets/1554169/13405215/67123310-deeb-11e5-9a2e-7c375ee5fad6.png)

* You will see two targets in your project, one for the application named `bob-swift` and one for tests named `bob-swiftTests`. If you chose to create an OSX application instead of an iOS application, you will not see a `bob-swiftTests` target and will have to create it manually.

* Drag the Exercism test file into the bob-swiftTests group, ensure that "Copy items if needed" is checked, and add the line `@testable import bob_swift ` on the second line of the Exercism test file:

![screen shot 2016-02-29 at 1 50 48 pm](https://cloud.githubusercontent.com/assets/1554169/13405240/7f1aadfc-deeb-11e5-8aa5-3ca7e1a12312.png)

* Create the working file/class (in this case, `Bob.swift`), and save **in the same folder as the Exercism test file**: _[see first image]_. Then, in Xcode, drag this file inside the bob-swift folder _[see second image]_.

* Select `Bob.swift` and in the File Inspector make sure that both `bob-swift` and `bob-swiftTests` are checked in the Target Membership area.

* Write the solution of the exercise in your working file (Bob.swift), in order to make the tests from the test file (BobTest.swift) succeed. Now the BobTest.swift file will show you some errors, but writing the right code in your working file Bob.swift should make them disappear.

* Don't write code or modify the BobTest.swift file, this file is only to verify if the code you wrote in your Bob.swift file is right. Neither add in your working file anything from the testing file, just take it as a reference to figure out how to solve the exercise. _If you prefer, you can also work in an independent Playground file and then copy your final code into your working file (Bob.swift) and continue with the testing._

* Then you just need to go to the Test Navigator _[see image below]_ and click on the grey play button next to the main test (BobTest in this case). If the tests passed, they will show you a green checkmark, if not, a red x mark. Modify your code on your working file (Bob.swift) until all the tests succeed.

<img width="256" alt="twx-runtst-6_2x" src="https://cloud.githubusercontent.com/assets/22910264/20458849/b8cd18ce-aeb0-11e6-833d-eb97aac2cb36.png">

* Some notes: XCTestCase is the XCTest subclass that contains our tests methods and XCTAssert lines are the expected results, with different types depending on what are you testing. Learn more about XCTAssert Methods and XCTesting itself <a href="http://rshankar.com/assertions-supported-in-xctest/" target="_blank">here</a> and <a href="http://nshipster.com/xctestcase/" target="_blank">here</a>.

* Now run the tests, and happy coding!

* When you are ready to submit, do so from the folder that contains the working file (`Bob.swift`) and the Exercism test file (`BobTest.swift`): 
`$> exercism submit Bob.swift`

\* Please note that I have used `bob-swift` as my example, to differentiate between the same exercise in multiple languages. If you hyphenate the project name, you will need to use an underscore instead of a hyphen in the name, in the test file. (`@testable import bob-swift` -> `@testable import bob_swift`)

## Running Tests

Test will run through the Xcode GUI using the XCTest framework.
