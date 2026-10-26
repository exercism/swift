# About

A [switch statement][switch] compares a value against multiple possible matching patterns.
It provides a cleaner, more readable alternative to chaining multiple `if-else` statements.

A `switch` statement starts with the `switch` keyword followed by the value to test.
Each possible match is introduced with the `case` keyword.
The `default` keyword defines a fallback case that executes if none of the explicit cases match.
Like `if-else` chains, a `switch` statement executes only the block of code associated with the first matching case.

```swift
switch value {
case 1:
    print("One")
case 2:
    print("Two")
default:
    print("Other")
}
```

Consider the following `if-else` chain:

```swift
if str == "apple" {
    print("Let's bake an apple crumble")
} else if str == "lemon" {
    print("Let's bake a lemon meringue pie!")
} else if str == "peach" {
    print("Let's bake a peach pie!")
} else {
    print("Let's buy ice cream.")
}
```

This can be written more clearly with a `switch` statement:

```swift
switch str {
case "apple":
    print("Let's bake an apple crumble")
case "lemon":
    print("Let's bake a lemon meringue pie!")
case "peach":
    print("Let's bake a peach pie!")
default:
    print("Let's buy ice cream.")
}
```

## Value Binding and Where Clauses

A `switch` case can bind matching values to temporary constants or variables for use in that case's body.
Cases can also include a `where` clause to check additional Boolean conditions before matching:

```swift
let x = 1337
switch sumOfDivisors(of: x) {
case let total where total == x:
    print(total, "is a perfect number")
default:
    print(x, "is not a perfect number")
}
```

[switch]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Switch
