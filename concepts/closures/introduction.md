# Introduction

[Closures][closures] in Swift are self-contained blocks of functionality that can accept parameters and return values.
Closures can also capture and store references to constants and variables from their surrounding context.
Because closures are first-class values in Swift, you can assign them to variables or constants and pass them as arguments to functions.

Functions in Swift are actually a special case of closures that have a fixed name and are defined using the `func` syntax.
When Swift developers refer to "closures," they usually mean [closure expressions][closure-expressions]—unnamed, inline closure blocks.

A closure expression lists its parameters and return type, followed by the `in` keyword and the closure's body, all enclosed in curly braces:

```swift
{ (a: Double, b: Double) -> Double in
    return (a + b) / 2.0
}
```

This defines a closure of type `(Double, Double) -> Double`.
You can execute it immediately by passing arguments:

```swift
{ (a: Double, b: Double) -> Double in
    return (a + b) / 2.0
}(10.0, 15.0)
// returns 12.5
```

More commonly, you assign closures to constants or variables and call them like functions:

```swift
let mean = { (a: Double, b: Double) -> Double in
    (a + b) / 2.0
}

mean(13.0, 100.0)
// returns 56.5
```

As shown above, if a closure's body consists of a single expression, you can omit the `return` keyword.

Closures are frequently passed as arguments to higher-order functions or returned from other functions:

```swift
[11, 75, 3, 99, 53].contains(where: { (x: Int) -> Bool in x > 100 })
// returns false

["apple", "ball", "carrot"].sorted(by: { (s1: String, s2: String) -> Bool in s1.count < s2.count })
// returns ["ball", "apple", "carrot"]

func makeAdder(base: Int) -> (Int) -> Int {
    { (x: Int) -> Int in base + x }
}
```

[closures]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/
[closure-expressions]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/#Closure-Expressions
