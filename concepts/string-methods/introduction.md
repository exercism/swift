# Introduction

Working with text is a common task in programming.
Swift—along with the Foundation framework—provides many convenient methods and properties to inspect, transform, and manipulate strings.

## Splitting Strings with `components(separatedBy:)`

To split a string into an array of substrings based on a delimiter, use `components(separatedBy:)` (requires importing Foundation):

```swift
import Foundation

let sentence = "Hello, world!"
let words = sentence.components(separatedBy: " ")
print(words) // Prints ["Hello,", "world!"]
```

## Checking Prefixes and Suffixes with `hasPrefix(_:)` and `hasSuffix(_:)`

To check whether a string begins or ends with a specific sequence of characters, use `hasPrefix(_:)` and `hasSuffix(_:)`:

```swift
let greeting = "Hello, world!"
print(greeting.hasPrefix("Hello"))  // Prints true
print(greeting.hasSuffix("world!")) // Prints true
```

## Changing Case

You can transform the casing of a string using these standard methods and properties:

- `lowercased()`: Returns a lowercase copy of the string.
- `uppercased()`: Returns an uppercase copy of the string.
- `capitalized`: Returns a copy where the first letter of each word is capitalized (from Foundation).

```swift
let greeting = "hello, world!"
print(greeting.lowercased())  // Prints "hello, world!"
print(greeting.uppercased())  // Prints "HELLO, WORLD!"
print(greeting.capitalized)   // Prints "Hello, World!"
```

## Replacing Substrings with `replacingOccurrences(of:with:)`

To replace all occurrences of a target substring with another string, use `replacingOccurrences(of:with:)` (from Foundation):

```swift
let greeting = "Hello, world!"
let updated = greeting.replacingOccurrences(of: "world", with: "Swift")
print(updated) // Prints "Hello, Swift!"
```

## Joining Strings with `joined(separator:)`

The `joined(separator:)` method belongs to collections of strings, such as `[String]`.
It joins elements together into a single string using a separator:

```swift
let words = ["Hello", "world"]
let sentence = words.joined(separator: ", ")
print(sentence) // Prints "Hello, world"
```

[components]: https://developer.apple.com/documentation/foundation/nsstring/components(separatedby:)-238fy
[hasPrefix]: https://developer.apple.com/documentation/foundation/nsstring/hasprefix(_:)
[hasSuffix]: https://developer.apple.com/documentation/foundation/nsstring/hassuffix(_:)
[lowercased]: https://developer.apple.com/documentation/foundation/nsstring/lowercased
[uppercased]: https://developer.apple.com/documentation/foundation/nsstring/uppercased
[capitalized]: https://developer.apple.com/documentation/foundation/nsstring/capitalized
[replacingOccurrences]: https://developer.apple.com/documentation/foundation/nsstring/replacingoccurrences(of:with:)
[joined]: https://developer.apple.com/documentation/swift/array/joined(separator:)-7uber
