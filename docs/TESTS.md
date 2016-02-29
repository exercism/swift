### Creating the project in Xcode

These steps will use the `bob` exercise as an example. If you are not working on `bob`, replace `bob` with your exercise name in the steps below.

* Select iOS-->Application and then Single View Application and click Next.
* Enter `bob-swift`* as your Product Name, set the language to Swift, and check "Include Unit Tests", and then click Next.
* Save the project in the same folder as the Exercism test file:
![screen shot 2016-02-29 at 1 50 17 pm](https://cloud.githubusercontent.com/assets/1554169/13405215/67123310-deeb-11e5-9a2e-7c375ee5fad6.png)
* You will see two targets in your project, one for the application named `bob-swift` and one for tests named `bob-swiftTests`. If you chose to create an OSX application instead of an iOS application, you will not see a `bob-swiftTests` target and will have to create it manually.
* Drag the Exercism test file into the bob-swiftTests group, ensure that "Copy items if needed" is checked, and add the line `@testable import bob_swift ` on the second line of the Exercism test file:
![screen shot 2016-02-29 at 1 50 48 pm](https://cloud.githubusercontent.com/assets/1554169/13405240/7f1aadfc-deeb-11e5-8aa5-3ca7e1a12312.png)
* Create the working file/class (in this case, `Bob.swift`), and save **in the same folder as the Exercism test file**: _[see first image]_
* Select `Bob.swift` and in the File Inspector make sure that both `bob-swift` and `bob-swiftTests` are checked in the Target Membership area.
* Now use CMD-U to run the tests, and happy coding!
* When you are ready to submit, do so from the folder that contains the working file (`Bob.swift`) and the Exercism test file (`BobTest.swift`): 
`$> exercism submit Bob.swift`

\* Please note that I have used `bob-swift` as my example, to differentiate between the same exercise in multiple languages. If you hyphenate the project name, you will need to use an underscore instead of a hyphen in the name, in the test file. (`@testable import bob-swift` -> `@testable import bob_swift`)

## Running Tests

Test will run through the Xcode GUI using the XCTest framework.
