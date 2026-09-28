# About

While Swift provides rich functionality in its Standard Library, you can access many additional features by importing external libraries and frameworks.
These modules may come directly from the Swift project (such as [Swift Argument Parser][argument-parser]), from Apple platform frameworks (such as [Foundation][apple-foundation] and the [Network Framework][network-framework]), or from third-party open-source libraries (such as [SwiftyBeaver][swifty-beaver]).

Core modules like Foundation—one of the most widely used libraries in Swift—are included with the Swift toolchain.
Third-party libraries must be added to your project configuration (for example, using Swift Package Manager) before they can be imported.

To import a module, write the `import` keyword followed by the module name:

```swift
import Foundation
```

Importing a module makes its types, methods, and functions available to your code.
For instance, importing Foundation extends `String` with useful utility methods like `components(separatedBy:)`.

By convention, `import` statements are placed at the top of a Swift file so dependencies are immediately visible to anyone reading the code.

[argument-parser]: https://apple.github.io/swift-argument-parser/documentation/argumentparser/
[network-framework]: https://developer.apple.com/documentation/network
[swifty-beaver]: https://github.com/SwiftyBeaver/SwiftyBeaver
[apple-foundation]: https://developer.apple.com/documentation/foundation
