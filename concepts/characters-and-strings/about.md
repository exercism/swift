# About

Strings are a data type that represent a text value.
[`Strings`][strings-and-characters] in Swift are a collection of `Character`s, which themselves hold a [Unicode scalar values][unicode-scalar-values].

You can create a String through a string literal, which is a series of characters enclosed in double quotation marks (`"`).
For multi-line strings, you can use triple quotation marks (`"""`).

```swift
let hello : String = "Hello, World!"

let poem : String = """
Roses are red,
Violets are blue.
Sugar is sweet,
And so are you.
"""
```

Strings in Swift also obtain all of the functionality of the [NSString][nsstring-docs] class which was originally used in Apple's Objective-C libraries.

## Character

`Character` is a data type that stores a single [Unicode scalar value][unicode-scalar-values] that is made up of one or more Unicode code points.
A Unicode scalar value is any [Unicode code][unicode] point in the range `U+0000` to `U+D7FF` inclusive or `U+E000` to `U+10FFFF` inclusive.

```swift
let aChar : Character = "A"
```

## Type inference

Swift can infer the type of a string literal, and will by default infer it to be a `String`.
You can explicitly declare a string to be a `Character` by using the `Character` type annotation, which requires the value to be a single character.

```swift
let aString = "A"
let aChar: Character = "A"
print(type(of: aString)) // Prints String
print(type(of: aChar))   // Prints Character

// The following code will not compile
let badChar: Character = "Too many characters"
// Error: Cannot convert value of type 'String' to specified type 'Character'
```

## Concatenation

In Swift can strings be [concatenated][] using the `+` operator.
Characters can **not** be concatenated with strings using the `+` operator without first converting the character to a string.

```swift
print("honey" + "comb")
// Prints "honeycomb"
```

The [`append(_:)`][append] method mutates the string by adding either a string or a character to the end of it.

```swift
var greeting = "Hello"
let world = ", world"
let period: Character = "."

greeting.append(world)
print(greeting) // Prints "Hello, world"

greeting.append(period)
print(greeting) // Prints "Hello, world."
```

## String interpolation

[String interpolation][string-interpolation] is a way of constructing a String based on values from different sources like variables and expressions.
To insert a value into a string using string interpolation, you place an expression or value in parentheses which are preceded by a backslash character.

```swift
let radius = 5.0
let circle = "The area of a circle with radius \(radius) is \(Double.pi * radius * radius)"
print(circle) // Prints "The area of a circle with radius 5.0 is 78.53981633974483"
```

## String and Character properties

Strings and characters have a few different _properties_ which can be queried to get information about the string or character.

### String properties

Here are some of the most common string properties, but to find all, see the [documentation][string-docs].

| Property  | Description                                    | Example                        |
| --------- | ---------------------------------------------- | ------------------------------ |
| `isEmpty` | Returns `true` if the string is empty          | `"Hello".isEmpty equals false` |
| `count`   | Returns the number of characters in the string | `"Hello".count   equals 5`     |

### Character properties

Here are some of the most common character properties, but to find all, see the [documentation][string-docs].

| Property       | Description                                   | Example                        |
| -------------- | --------------------------------------------- | ------------------------------ |
| `isLowercase`  | Returns `true` if the character is lowercase  | `"a".isLowercase  equals true` |
| `isUppercase`  | Returns `true` if the character is uppercase  | `"A".isUppercase  equals true` |
| `isNumber`     | Returns `true` if the character is a number   | `"1".isNumber     equals true` |
| `isWhitespace` | Returns `true` if the character is whitespace | `" ".isWhitespace equals true` |

## Type conversion

To convert a type to a string, you can use the `String()` initializer, which accepts a variety of types, including `Int`, `Double`, `Character`, and more.

```swift
let charX: Character = "x"
print(String(charX))     // Prints "x"
print(String(110))       // Prints "110"
print(String(Double.pi)) // Prints "3.141592653589793"
```

## Special characters

Swift has a few [special characters][special-characters] that can be used in strings.

| Value    | Description                   |
| -------- | ----------------------------- |
| `\0`     | Null character                |
| `\\`     | Backslash                     |
| `\t`     | Horizontal tab                |
| `\n`     | Line feed                     |
| `\r`     | Carriage return               |
| `\'`     | Single quote mark             |
| `\"`     | Double quote mark             |
| `\uFFFF` | Hexadecimal unicode character |

```swift
let quote : String = "\"Hello\", he said."
print(quote) // Prints "Hello", he said.

let unicode : Character = "\u{1F496}"
print(unicode) // Prints 💖
```

[strings-and-characters]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/
[string-docs]: https://developer.apple.com/documentation/swift/String
[nsstring-docs]: https://developer.apple.com/documentation/foundation/nsstring
[character-docs]: https://developer.apple.com/documentation/swift/character
[string-interpolation]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/#String-Interpolation
[unicode-scalar-values]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/
[unicode]: https://en.wikipedia.org/wiki/Unicode
[concatenated]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/#Concatenating-Strings-and-Characters
[append]: https://developer.apple.com/documentation/swift/string/append(_:)-4xa8f
[special-characters]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/#Special-Characters-in-String-Literals
