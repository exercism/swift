# About

In Swift, functions can [return multiple values][multiple-return-values] by returning a tuple:

```swift
func reverseAndLength(_ str: String) -> (reverse: String, length: Int) {
    return (reverse: String(str.reversed()), length: str.count)
}

let result = reverseAndLength("Hello")
print(result.reverse) // Prints "olleH"
print(result.length)  // Prints 5
```

[multiple-return-values]: https://docs.swift.org/swift-book/LanguageGuide/Functions.html#ID164
