# About

## Comparison operators

[Comparison operators][comparison-operators] are used to compare values and return a `true` or `false` value.
These operators require 2 values to be compared of the same type.
If the values are not of the same type then the compiler will throw an error.
Here is a list of the comparison operators and an example of when they give a `true` value:

| Method | Description           | Example |
| ------ | --------------------- | ------- |
| ==     | equal                 | 1 == 1  |
| !=     | not equal             | 1 != 2  |
| <      | less than             | 4 < 5   |
| <=     | less than or equal    | 4 <= 4  |
| >      | greater than          | 3 > 1   |
| >=     | greater than or equal | 2 >= 2  |

## If & Else statements

A [conditional statement][conditional-statement] allows you to execute code based on a condition which is either `true` or `false`.
The most basic conditional statement is an [if statement][if] which executes code when the condition is `true`.
To declare an if statement you use the `if` keyword followed by the condition and then the code to execute in curly braces.

```swift
let wheelCount = 4
if wheelCount == 4 {
  print("Your vehicle is a car")
}
// Prints "Your vehicle is a car"
```

If can be combined with else to execute code when the condition is `false`.
The else statement needs to be used with an if statement and cannot be used on its own.
To declare an else statement you use the `else` keyword after an if statement's curly braces, followed by the code to execute in curly braces.

```swift
let precipitationInMM = 0.5
if precipitationInMM > 0.5 {
  print("You will need an umbrella")
} else {
  print("You will not need an umbrella")
}
// Prints "You will not need an umbrella"
```

If statements can also be chained together using else if to check multiple conditions.
It follows the same principle as defining an if statement but the keyword is `else if` instead of `if`.
As If statement don't they need an else statement to be valid, but they can have one if needed.

```swift
let favoriteFruit = "Apple"

if favoriteFruit == "Banana" {
    print("Your favorite fruit is a banana")
} else if favoriteFruit == "Orange" {
    print("Your favorite fruit is an orange")
} else if favoriteFruit == "Apple" {
    print("Your favorite fruit is an apple")
} else {
    print("Your favorite fruit is not a banana, orange or apple")
}
// Prints "Your favorite fruit is an apple"
```

## If expression

If statements can also be used as expressions to assign a value to a variable.
The last statement in the if block is used as the value of the if expression.
This can be useful when you want to assign a value to a variable based on a condition.

```swift
let CpuBits = 32
let largest = if CpuBits == 64 {
  "x86_64"
} else {
  "x86_32"
}

print(largest)
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
