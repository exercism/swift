# About

## Numbers

Swift provides two primary categories of numbers: integers and floating-point numbers.

- [Integers][integers] represent whole numbers with no fractional component, such as `0`, `1`, `-1`, `42`, and `-273`.
- [Floating-point numbers][floatingpoint] represent numbers with a fractional component, such as `0.0`, `3.14`, and `-1.36969e-10`.

You can insert underscores into numeric literals to improve readability: `1_000_000` is identical to `1000000`.
Floating-point literals can be written in decimal or exponential notation.

In most cases, you use [`Int`][int] for integers and [`Double`][double] for floating-point numbers:

```swift
let speed: Int = 42                           // Explicit Int
let pi: Double = 3.14                         // Explicit Double
let giga: Double = 1_000_000_000              // Double with readability underscores
let plancksConstant: Double = 6.62607015e-34  // Double in scientific notation
```

## Arithmetic Operators

Swift provides standard [arithmetic operators][arithmetic-operators] for numeric calculations:

| Operator | Description    | Example |
| -------- | -------------- | ------- |
| `+`      | Addition       | `4 + 6` evaluates to `10` |
| `-`      | Subtraction    | `15 - 10` evaluates to `5` |
| `*`      | Multiplication | `2 * 3` evaluates to `6`  |

~~~~exercism/caution
Swift is type-safe and does not allow mixing different numeric types in arithmetic operations.
You cannot directly add or multiply an `Int` and a `Double`; you must convert one type to match the other first.
~~~~

### Division

The `/` operator performs division.
When both operands are integers, integer division truncates any fractional remainder:

```swift
5.0 / 2.0 // 2.5 (Double division)
5 / 2     // 2 (integer division truncates the remainder)
```

Dividing a non-zero floating-point number by zero results in `inf` or `-inf`.
Dividing `0.0` by `0.0` produces `nan` (Not a Number).
In contrast, dividing an integer by zero causes a compile-time or runtime error:

```swift
print(5.0 / 0.0)  // Prints inf
print(-5.0 / 0.0) // Prints -inf
print(0.0 / 0.0)  // Prints nan

// The following line will not compile:
// print(5 / 0) // Error: Division by zero
```

### Remainder Operator

The [remainder operator][remainder-operator] (`%`) calculates the remainder left over after dividing two integers:

```swift
5 % 2  // 1
-5 % 2 // -1

// Dividing by zero produces an error:
// 5 % 0 // Error: Division by zero
```

~~~~exercism/note
In Swift, `%` is a true *remainder* operator rather than a modulo operator.
The result always takes the sign of the first operand (the dividend), regardless of the sign of the second operand:

```swift
5 % -2  // 1
-5 % 2  // -1
```
~~~~

## Rounding Floating-Point Numbers

You can round a floating-point number using the `rounded()` method.
By default, `rounded()` rounds to the nearest integer.
You can also supply a specific [rounding rule][rounding-rule], such as `.up` or `.down`:

```swift
let x = 3.14
let y = x.rounded()      // 3.0
let w = x.rounded(.down) // 3.0
let z = x.rounded(.up)   // 4.0
```

## Type Inference

When you declare a numeric constant or variable without a type annotation, Swift infers its type:

- Whole numbers default to `Int`.
- Numbers with a decimal point default to `Double`.

```swift
let x = 42         // Inferred as Int
let y = 42.0       // Inferred as Double
let z: Double = 42 // Explicitly typed as Double
```

## Type Conversion

To perform operations between values of different types, convert one value using type initializers like `Double(_:)` or `Int(_:)`:

```swift
let integerCount = 42
let floatingCount = Double(integerCount)
print(floatingCount) // Prints 42.0

let pi = 3.14
let integerPi = Int(pi)
print(integerPi) // Prints 3 (fractional part is truncated)
```

[integers]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Integers
[floatingpoint]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Floating-Point-Numbers
[int]: https://developer.apple.com/documentation/swift/int
[double]: https://developer.apple.com/documentation/swift/double
[arithmetic-operators]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Arithmetic-Operators
[remainder-operator]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Remainder-Operator
[rounding-rule]: https://docs.swift.org/main/documentation/swift/floatingpointroundingrule
[type-conversion]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Integer-and-Floating-Point-Conversion
