# About

A string represents textual data.
In Swift, a [`String`][strings-and-characters] is an ordered collection of `Character` values, where each character represents a Unicode character.

You create a string using a string literal, which is a sequence of characters surrounded by double quotation marks (`"`).
For multi-line strings, use three double quotation marks (`"""`):

```swift
let hello: String = "Hello, World!"

let poem: String = """
Roses are red,
Violets are blue.
Sugar is sweet,
And so are you.
"""
```

Swift strings bridge seamlessly with the Foundation framework's [`NSString`][nsstring-docs] class, providing access to extensive text-processing capabilities.

## Characters

A `Character` represents a single extended grapheme cluster—a human-readable character composed of one or more [Unicode scalar values][unicode-scalar-values].
A Unicode scalar value is a 21-bit code point in the range `U+0000` to `U+D7FF` inclusive or `U+E000` to `U+10FFFF` inclusive.

```swift
let aChar: Character = "A"
```

## Type Inference

When you write a string literal, Swift automatically infers its type as `String`.
To store a single character as a `Character`, you must provide an explicit type annotation:

```swift
let aString = "A"        // Inferred as String
let aChar: Character = "A" // Explicitly typed as Character
print(type(of: aString)) // Prints String
print(type(of: aChar))   // Prints Character

// The following code will not compile:
let badChar: Character = "Too many characters"
// Error: Cannot convert value of type 'String' to specified type 'Character'
```

## Concatenation

You can join strings together using the addition operator (`+`):

```swift
print("honey" + "comb")
// Prints "honeycomb"
```

You cannot directly concatenate a `Character` to a `String` using `+` without first converting the character to a string.
However, you can use the [`append(_:)`][append] method to append either a string or a character directly to a mutable string:

```swift
var greeting = "Hello"
let world = ", world"
let period: Character = "."

greeting.append(world)
print(greeting) // Prints "Hello, world"

greeting.append(period)
print(greeting) // Prints "Hello, world."
```

## String Interpolation

[String interpolation][string-interpolation] allows you to construct a string by embedding constants, variables, literals, and expressions inside string literals.
Wrap each expression in parentheses preceded by a backslash (`\(` ... `)`):

```swift
let radius = 5.0
let circle = "The area of a circle with radius \(radius) is \(Double.pi * radius * radius)"
print(circle) // Prints "The area of a circle with radius 5.0 is 78.53981633974483"
```

## String and Character Properties

Strings and characters offer several properties to inspect their content.

### String Properties

Common string properties include:

| Property  | Description                                    | Example                          |
| --------- | ---------------------------------------------- | -------------------------------- |
| `isEmpty` | Returns `true` if the string has no characters | `"Hello".isEmpty` evaluates to `false` |
| `count`   | Returns the number of characters in the string | `"Hello".count` evaluates to `5`       |

For a complete list of properties, see the [Apple String documentation][string-docs].

### Character Properties

Common character properties include:

| Property       | Description                                   | Example                              |
| -------------- | --------------------------------------------- | ------------------------------------ |
| `isLowercase`  | Returns `true` if the character is lowercase  | `"a".isLowercase` evaluates to `true` |
| `isUppercase`  | Returns `true` if the character is uppercase  | `"A".isUppercase` evaluates to `true` |
| `isNumber`     | Returns `true` if the character is a digit    | `"1".isNumber` evaluates to `true`    |
| `isWhitespace` | Returns `true` if the character is whitespace | `" ".isWhitespace` evaluates to `true`|

For a complete list of properties, see the [Apple Character documentation][character-docs].

## Type Conversion

You can convert other types into strings by using the `String(_:)` initializer, which supports standard types like `Int`, `Double`, and `Character`:

```swift
let charX: Character = "x"
print(String(charX))     // Prints "x"
print(String(110))       // Prints "110"
print(String(Double.pi)) // Prints "3.141592653589793"
```

## Special Characters

Swift string literals support several [escape sequences][special-characters] for special characters:

| Sequence   | Description                   |
| ---------- | ----------------------------- |
| `\0`       | Null character                |
| `\\`       | Backslash                     |
| `\t`       | Horizontal tab                |
| `\n`       | Line feed (newline)           |
| `\r`       | Carriage return               |
| `\'`       | Single quotation mark         |
| `\"`       | Double quotation mark         |
| `\u{n}`    | Arbitrary Unicode scalar (hexadecimal) |

```swift
let quote: String = "\"Hello\", he said."
print(quote) // Prints "Hello", he said.

let unicode: Character = "\u{1F496}"
print(unicode) // Prints 💖
```

[strings-and-characters]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/
[string-docs]: https://developer.apple.com/documentation/swift/String
[nsstring-docs]: https://developer.apple.com/documentation/foundation/nsstring
[character-docs]: https://developer.apple.com/documentation/swift/character
[string-interpolation]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/#String-Interpolation
[unicode-scalar-values]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/
[concatenated]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/#Concatenating-Strings-and-Characters
[append]: https://developer.apple.com/documentation/swift/string/append(_:)-4xa8f
[special-characters]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/#Special-Characters-in-String-Literals
