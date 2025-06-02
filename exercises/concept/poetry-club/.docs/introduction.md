# Introduction

## Importing

While Swift includes a lot of functionality in its Standard Library, there is much more functionality available in the form of external libraries.
These libraries may be from the Swift project itself, such as the [Swift Argument Parser][argument-parser], closed source libraries from companies Apple's [Network Framework][network-framework], or third-party libraries, like [Swifty Beaver][swifty-beaver].

Some of these modules, like the Network Framework or [Foundation][apple-foundation] (which is probably the most commonly used library in Swift) come with your Swift distribution.
External third party libraries need to be added to your project before they can be imported, though that is out of the scope of this exercise.

Importing modules is done by writing the `import` keyword followed by the name of the module. So one can import Foundation by adding the following to their program.

```swift
import Foundation
```

This allows access to all of the types, values, and functionality inside that module; for example if one wishes to use the `components(separatedBy:)` String method, that method becomes available to `String` with this import.

While they can be placed in the code anywhere before a pice of code that makes use of one the content of module, import statements are usually placed at the beginning of the file that uses them for greater readability.

## String indexing

Individual characters in a `String` can be accessed using the subscripting method used with arrays.
However, the [indices][string-indices] used for strings are _not_ integers and can not be worked with directly.
Instead they must be computed based off of some other known index, such as `startIndex`, which points to the position of the first character in a nonempty string, using the methods available in the [`String`][string-docs] and [`NSString`][nsstring-docs] libraries (when the `Foundation` module is imported, strings in Swift have access to all of the NSString properties and methods).

For example, given the following string:

```swift
let csv = "apple,pear,peach,orange,cherry,lime,goosberry"
```

One cannot write `csv[21]` to get the "g" in "orange", they must instead compute a value of type `String.Index` and supply that index instead.
Note that these indices are not meant to be human-consumable on their own.
They are what is referred to as _opaque indices_ ,as humans need not know what is inside them.

```swift
let index = csv.index(csv.startIndex, offsetBy: 21)
csv[index]
// "g"
print(index)
// prints Index(_rawBits: 1376513)
```

Note, however, that if the offset is not a valid index, i.e. if it would return the index before `startIndex` or after `endIndex` the operation will raise an error, crashing the program.
To prevent this problem, one can specify a limiting index.
This returns an optional index and it will return nil for otherwise invalid indices.

```swift
let tooFar = csv.index(csv.startIndex, offsetBy: 200)
// error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).
let tooFarButSafe = csv.index(csv.startIndex, offsetBy: 200, limitedBy: csv.endIndex)
// nil
```

Additionally, indices cannot be shared between strings.
For example, using the `index` of the "g" in "orange" computed above to index into the string `fam = "This is my family: 👨‍👩‍👦‍👦, this is our dog: 🐶, this is our cat: 🐱!"`, i.e. `fam[index]` will crash your program.

There are many reasons for all of this, but they all basically boil down to "Unicode is tricky".

Generally speaking if you need random access to individual characters, you likely want to be using some other data structure, like `Array<Character>`.

### Some useful methods

Swift has the methods `first` and `last` to get the first and last character of a string.
These methods return an optional character, so if the string is empty, they will return nil.

```swift
let str = "Hello, world!"
print(str.first) // Prints Optional("H")
print(str.last)  // Prints Optional("!")
```

You can also use the `prefix` and `suffix` methods to get a substring of a string.
These methods take an integer as an argument and return a substring containing the first or last n characters of the string.

```swift
let str = "Hello, world!"
print(str.prefix(5)) // Prints "Hello"
print(str.suffix(6)) // Prints "world!"
```

## String methods

Working with string is a common task in programming.
Therefore Swift provides a variety of methods to manipulate strings.
This document will cover some of the most common string methods and properties, some of these require the import of the Foundation framework.

### [`components(separatedBy:)`][components]

When you want to split a string into an array of substrings, you can use the `components(separatedBy:)` method.
So say you would want to get every word in a sentence, you can use the space character as the separator.

```swift
let sentence = "Hello, world!"
let words = sentence.components(separatedBy: " ")
print(words) // Prints ["Hello,", "world!"]
```

### [`hasPrefix(_:)`][hasPrefix], [`hasSuffix(_:)`][hasSuffix]

When you want to check if a string starts or ends with a certain substring, you can use the `hasPrefix(_:)` and `hasSuffix(_:)` methods.
Both of these methods take a string as an argument and return a boolean value indicating whether the string starts or ends with the specified substring.

```swift
let greeting = "Hello, world!"
print(greeting.hasPrefix("Hello"))  // Prints true
print(greeting.hasSuffix("world!")) // Prints true
```

### [`lowercased`][lowercased], [`uppercased`][uppercased], [`capitalized`][capitalized]

When you want to change the case of a string, you can use the `lowercased`, `uppercased`, and `capitalized` properties.
The `lowercased` property returns a new string with all characters in lowercase, the `uppercased` property returns a new string with all characters in uppercase, and the `capitalized` property returns a new string with the first character of each word capitalized.

```swift
let greeting = "hello, world!"
print(greeting.lowercased)  // Prints "hello, world!"
print(greeting.uppercased)  // Prints "HELLO, WORLD!"
print(greeting.capitalized) // Prints "Hello, World!"
```

### [`replacingOccurrences(of:with:)`][replacingOccurrences]

When you want to replace all occurrences of a substring in a string with another substring, you can use the `replacingOccurrences(of:with:)` method.
This method takes two strings as arguments: the substring to be replaced and the substring to replace it with. It returns a new string with all occurrences of the specified substring replaced.

```swift
let greeting = "Hello, world!"
let newGreeting = greeting.replacingOccurrences(of: "world", with: "Swift")
print(newGreeting) // Prints "Hello, Swift!"
```

### [`joined(separator:)`][joined]

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
[string-docs]: https://developer.apple.com/documentation/swift/String
[nsstring-docs]: https://developer.apple.com/documentation/foundation/nsstring
[string-format-specifiers]: https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html
[string-indices]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/#String-Indices
[unicode]: https://en.wikipedia.org/wiki/Unicode
[argument-parser]: https://apple.github.io/swift-argument-parser/documentation/argumentparser/
[network-framework]: https://developer.apple.com/documentation/network
[swifty-beaver]: https://github.com/SwiftyBeaver/SwiftyBeaver
[apple-foundation]: https://developer.apple.com/documentation/foundation
