# About

In Swift, you can define [functions inside other functions][nested-functions].
These are known as **nested functions**.

Nested functions are commonly used as private helpers that perform specific tasks for the enclosing function without cluttering the outer scope:

```swift
func makeNumber(_ number: Int) -> Int {
    func double(_ x: Int) -> Int {
        x * 2
    }

    func increment(_ x: Int) -> Int {
        x + 1
    }

    return number.isMultiple(of: 2) ? increment(double(number)) : double(number)
}

print(makeNumber(3)) // Prints 6
print(makeNumber(4)) // Prints 9
```

Nested functions behave like standard functions, but their visibility is restricted to the enclosing function's body.

[nested-functions]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/#Nested-Functions
