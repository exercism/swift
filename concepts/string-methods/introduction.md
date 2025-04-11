# Introduction

Working with string is a common task in programming.
Therefore Swift provides a variety of methods to manipulate strings.
This document will cover some of the most common string methods and properties, some of these require the import of the Foundation framework.

## [`components(separatedBy:)`][components]

When you want to split a string into an array of substrings, you can use the `components(separatedBy:)` method.
So say you would want to get every word in a sentence, you can use the space character as the separator.

```swift
let sentence = "Hello, world!"
let words = sentence.components(separatedBy: " ")
print(words) // Prints ["Hello,", "world!"]
```

## [`hasPrefix(_:)`][hasPrefix], [`hasSuffix(_:)`][hasSuffix]

When you want to check if a string starts or ends with a certain substring, you can use the `hasPrefix(_:)` and `hasSuffix(_:)` methods.
Both of these methods take a string as an argument and return a boolean value indicating whether the string starts or ends with the specified substring.

```swift
let greeting = "Hello, world!"
print(greeting.hasPrefix("Hello"))  // Prints true
print(greeting.hasSuffix("world!")) // Prints true
```

## [`lowercased`][lowercased], [`uppercased`][uppercased], [`capitalized`][capitalized]

When you want to change the case of a string, you can use the `lowercased`, `uppercased`, and `capitalized` properties.
The `lowercased` property returns a new string with all characters in lowercase, the `uppercased` property returns a new string with all characters in uppercase, and the `capitalized` property returns a new string with the first character of each word capitalized.

```swift
let greeting = "hello, world!"
print(greeting.lowercased)  // Prints "hello, world!"
print(greeting.uppercased)  // Prints "HELLO, WORLD!"
print(greeting.capitalized) // Prints "Hello, World!"
```

## [`replacingOccurrences(of:with:)`][replacingOccurrences]

When you want to replace all occurrences of a substring in a string with another substring, you can use the `replacingOccurrences(of:with:)` method.
This method takes two strings as arguments: the substring to be replaced and the substring to replace it with. It returns a new string with all occurrences of the specified substring replaced.

```swift
let greeting = "Hello, world!"
let newGreeting = greeting.replacingOccurrences(of: "world", with: "Swift")
print(newGreeting) // Prints "Hello, Swift!"
```

## [`joined(separator:)`][joined]

This isn't a method of the String type, but rather of the Array type.
When you want to join an array of strings into a single string with a specified separator, you can use the `joined(separator:)` method.
This method takes a string as an argument and returns a new string with all elements of the array joined together, separated by the specified string.

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
