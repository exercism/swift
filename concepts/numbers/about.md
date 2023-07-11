# About

## Numbers

Swift has 2 main types of numbers: integers and floating-point numbers.
Integers are whole numbers, e.g. `0`, `1`, `-1`, `42`, and `-273`.
Floating-point numbers are numbers with a fractional component, e.g. `0.0`, `3.14`, and `-1.36969e-10`.

In most cases you would define the type for integers as `Int` and for floating-point numbers as `Double`.

To declare a variable or constant to be of type `Int` or `Double`, you can use a type annotation:

```swift
let Speed: Int = 42   // Speed is an Int
let Pi: Double = 3.14 // Pi is a Double
``` 

## Arithmetic operators

The `+` operator is used for addition, the `-` operator is used for subtraction, and the `*` operator is used for multiplication.

| Operator | Example        |
| -------- | -------------- |
| `+`      | `4 + 6   // equals  10`  |
| `-`      | `15 - 10 // equals  5` |
| `*`      | `2 * 3   // equals  6`   |

### Division

The `/` operator is used for division.
When using at least one floating-point number, the result will be a floating-point number.
When using only integers, the result will be an integer.

```swift
5 / 2.0 // equals 2.5
5 / 2   // equals 2
```

When dividing by zero, depending on the type of number, you will get a different result.
If you divide a floating-point number by zero, the result will be `inf`, or `-inf` if the number being divided is negative.
Only exception is when you divide zero by zero, and one of them being a floating point number which will result in `nan`.
If you divide an integer by zero, you will get a compile error.

```swift
print(5.0 / 0)  // Prints inf
print(-5 / 0.0) // Prints -inf
print(0.0 / 0)  // Prints nan

// The following code will not compile
print(5 / 0) // error: division by zero
```

### Remainder

The `%` operator is used for remainder and does only work with integers.
The operator returns the remainder of the division of the first argument by the second argument.
And as with division, having the second argument having the value of zero will result in a compile error.

```exercism/note
In other languages, this is this operator also known as the modulo operator.
But in Swift, it does not work the same way as the modulo operator, since it strictly speaking it returns the remainder, not the modulo.
```

```swift
5 % 2  // equals 1
-5 % 2 // equals -1

// The following code will not compile
print(5 % 0) // error: division by zero
```

## Type inference

When a number is written as a whole number in Swift code, without any additional context to steer the type inference engine in the right direction, the Swift compiler will assume that number is an `Int`. If you want to tell the compiler that you want it to be a `Double` you must use either a type annotation or append a .0 onto the end of the number literal. E.g.

```swift
let x = 42         // x is an Int
let y = 42.0       // y is a Double
let z: Double = 42 // z is a Double
```

You can read more about this in [A Tour of Swift: Type Safety and Inference][typeinference].

## Numeric Literals

Integers in Swift may be typed out in many ways, including as decimals, hexadecimals, binary, or octal numbers. Floating-point numbers may be typed in decimal or hexadecimal.

Numeric literals may also include the underscore character (`_`) which is used to group numbers and improve readability. E.g. rather than write `18093402034`, one can more clearly write `18_093_402_034`.

For specifics on numeric literals in Swift, read [A Tour of Swift: Numeric Literals][numericliterals].

## Type Conversion

In Swift, assignment of a value between different types requires explicit conversion. For example, to convert an `Int` to a `Double` and vice versa, you would need to do the following:

```swift
let x = 42
let d = Double(x)

let pi = Double.pi
let iPi = Int(pi)

print("x:", x, "is of type:", type(of: x))
// Output: x: 42 is of type: Int

print("d:", d, "is of type:", type(of: d))
// Output: d: 42.0 is of type: Double

print("pi:", pi, "is of type:", type(of: pi))
// Output: pi: 3.141592653589793 is of type: Double

print("iPi:", iPi, "is of type:", type(of: iPi))
// Output: fiPi: 3 is of type: Int
```

Note that in some cases, where the value is out of range for the target type, attempting to convert types will lead to an error. If the compiler can detect the problem, the code will fail to compile, otherwise, a runtime error will occur. E.g.

[integers]: https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html#ID317
[floatingpoint]: https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html#ID321
[int]: https://developer.apple.com/documentation/swift/int
[double]: https://developer.apple.com/documentation/swift/double
[arithmeticoperators]: https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID63
[comparisonoperators]: https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID70
[typeinference]: https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html#ID322
[numericliterals]: https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html#ID323
