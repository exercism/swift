# Introduction

## Comparison Operators

[Comparison operators][comparison-operators] compare two values of the same type and return a `Bool` value (`true` or `false`).
If you try to compare values of different types, the compiler produces an error.

The standard comparison operators in Swift are:

| Operator | Description              | Example         |
| -------- | ------------------------ | --------------- |
| `==`     | Equal to                 | `1 == 1` (true) |
| `!=`     | Not equal to             | `1 != 2` (true) |
| `<`      | Less than                | `4 < 5`  (true) |
| `<=`     | Less than or equal to    | `4 <= 4` (true) |
| `>`      | Greater than             | `3 > 1`  (true) |
| `>=`     | Greater than or equal to | `2 >= 2` (true) |

## If and Else Statements

A [conditional statement][conditional-statement] executes code based on whether a condition evaluates to `true` or `false`.
The most common conditional is an [if statement][if], which runs a block of code only when its condition is `true`.
Write an `if` statement using the `if` keyword, followed by the condition and the code block enclosed in curly braces:

```swift
let wheelCount = 4
if wheelCount == 4 {
    print("Your vehicle is a car")
}
// Prints "Your vehicle is a car"
```

You can pair `if` with an `else` clause to run alternative code when the condition is `false`:

```swift
let precipitationInMM = 0.5
if precipitationInMM > 0.5 {
    print("You will need an umbrella")
} else {
    print("You will not need an umbrella")
}
// Prints "You will not need an umbrella"
```

To test multiple conditions in sequence, chain statements together using `else if`.
An `if` statement does not require an `else` branch, but you can include one to handle cases when none of the conditions match:

```swift
let favoriteFruit = "Apple"

if favoriteFruit == "Banana" {
    print("Your favorite fruit is a banana")
} else if favoriteFruit == "Orange" {
    print("Your favorite fruit is an orange")
} else if favoriteFruit == "Apple" {
    print("Your favorite fruit is an apple")
} else {
    print("Your favorite fruit is not a banana, orange, or apple")
}
// Prints "Your favorite fruit is an apple"
```

## If Expressions

In modern Swift, `if` statements can also be used as expressions that produce a value.
Each branch evaluates to a value, making it easy to assign results conditionally:

```swift
let cpuBits = 32
let architecture = if cpuBits == 64 {
    "x86_64"
} else {
    "x86_32"
}

print(architecture)
// Prints "x86_32"
```

## Ternary operator

[Ternary operator][ternary-operator] is a short form of an if-else statement.
It takes a boolean expression and two expressions separated by a colon.
The first expression is evaluated if the boolean expression is true, otherwise the second expression is evaluated.
It has the following setup: `Boolean-expression ? expression1 : expression2`.

The ternary operator is great when you want a short form of an if-else statement and the expressions are short:

```swift
let showFahrenheit = true
let temperatureInCelsius = 30

let temperature = showFahrenheit ? temperatureInCelsius * 9 / 5 + 32 : temperatureInCelsius
print(temperature)
// Prints 86
```

The example above is shorthand for the code below:
    
```swift
let showFahrenheit = true
let temperatureInCelsius = 30

let temperature = if showFahrenheit {
    temperatureInCelsius * 9 / 5 + 32
} else {
    temperatureInCelsius
}
```

[comparison-operators]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators#Comparison-Operators
[conditional-statement]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Conditional-Statements
[if]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#If
[ternary-operator]: https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID71
