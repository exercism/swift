# About

In Swift, you can define multiple functions with the same name as long as their signatures differ.
This practice is known as **function overloading**.

Consider the following base function:

```swift
func add(_ x: Int, and y: Int, doubleResult: Bool) -> Int {
    let sum = x + y
    return doubleResult ? sum * 2 : sum
}

let twentySix = add(6, and: 7, doubleResult: true)
// => 26
```

In Swift, two functions with the same name are considered distinct if any of the following conditions are met:

- They have a different number of parameters.
- They have different external argument labels.
- Their parameter types differ.
- Their return types differ (provided the calling context clarifies which one to use).

Given the original `add` function above, each of the following overloads is distinct and valid in the same program:

```swift
// 1. Different number of parameters
func add(_ x: Int, and y: Int) -> Int {
    x + y
}

let eleven = add(5, and: 6)
// => 11

// 2. Different parameter type (Double instead of Int)
func add(_ x: Double, and y: Int, doubleResult: Bool) -> Double {
    let sum = x + Double(y)
    return doubleResult ? sum * 2 : sum
}

let twentySeven = add(6.5, and: 7, doubleResult: true)
// => 27.0

// 3. Different argument label (doubleThat instead of doubleResult)
func add(_ x: Int, and y: Int, doubleThat: Bool) -> Int {
    let sum = x + y
    return doubleThat ? sum * 2 : sum
}

let thirteen = add(6, and: 7, doubleThat: false)
// => 13
```

## Overloading by Return Type

Functions can also be overloaded solely by their return type.
However, when calling such a function, you must provide a type annotation or context so the compiler knows which overload you intended:

```swift
func add(_ x: Int, and y: Int, doubleResult: Bool) -> Double {
    let sum = Double(x + y)
    return doubleResult ? sum * 2 : sum
}

// Ambiguous call (compiler cannot decide whether you want Int or Double):
// let thirty = add(6, and: 9, doubleResult: true)

// Resolved with an explicit type annotation:
let thirty: Double = add(6, and: 9, doubleResult: true)
// => 30.0
```

## What Does Not Distinguish Overloads

Changing only the *internal parameter name* without changing the argument label, parameter type, or parameter count does not create a distinct function.
The compiler treats this as an invalid duplicate declaration:

```swift
func add(_ w: Int, and y: Int, doubleResult: Bool) -> Int {
    let sum = w + y
    return doubleResult ? sum * 2 : sum
}
// Error: Invalid redeclaration of 'add(_:and:doubleResult:)'
```
