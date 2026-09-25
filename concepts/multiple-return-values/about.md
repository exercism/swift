# About

## Multiple Return Values

In Swift, functions can [return multiple values][multiple-return-values] by returning a tuple:

```swift
func reverseAndLength(_ str: String) -> (reverse: String, length: Int) {
    return (reverse: String(str.reversed()), length: str.count)
}

let result = reverseAndLength("Hello")
print(result.reverse) // Prints "olleH"
print(result.length)  // Prints 5
```

## Omitting the Return Keyword

When a function's body consists of a single expression, you can [omit the `return` keyword][implicit-returns]:

```swift
func reverseAndLength(_ str: String) -> (reverse: String, length: Int) {
    (reverse: String(str.reversed()), length: str.count)
}
```

This implicit return syntax applies to all functions that return a value, not just those returning tuples.

[multiple-return-values]: https://docs.swift.org/swift-book/LanguageGuide/Functions.html#ID164
[implicit-returns]: https://docs.swift.org/swift-book/LanguageGuide/Functions.html#ID607
