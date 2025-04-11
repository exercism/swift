# About

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

## Some useful methods

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

## Deep Dive: Unicode indexing

~~~~exercism/advanced

[Unicode][unicode] is a standard for encoding text, it features a large number of characters from many different languages and scripts.
It is a superset of ASCII, which means that all ASCII characters are also Unicode characters.
Unicode is a variable-length encoding, meaning that some characters take up more bytes than others.
And why that matters will be explained in the next section.

So we have to go other languages (than English) to actually see the problem, let's take the character "ü" from the German language (note that here are we using the 2 byte variant there is also a 1 byte version).
It may at first look like a single character, but it is actually two characters: "u" and "¨", so if you printed the length of the string "ü" it would be 2 in languages like Python.
However, as a user or a programmer we would say that it is a single character and Swift actually agrees with us.
But why does Swift do that but Python does not?
The answer is that Swift uses a different representation of strings than Python.
In Python, strings are represented as a sequence of bytes, which means that the length of a string is the number of bytes it takes up in memory.
In Swift, strings are represented as a sequence of characters, which means that the length of a string is the number of characters it contains.
This is a very important distinction, because it means that in Swift, the length of a string is not necessarily the same as the number of bytes it takes up in memory.
This in turn is what makes so we can't use integers to index into strings.
~~~~

[string-docs]: https://developer.apple.com/documentation/swift/String
[nsstring-docs]: https://developer.apple.com/documentation/foundation/nsstring
[string-format-specifiers]: https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html
[string-indices]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/#String-Indices
[unicode]: https://en.wikipedia.org/wiki/Unicode
