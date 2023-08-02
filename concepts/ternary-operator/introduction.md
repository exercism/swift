# About

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

[ternary-operator]: https://docs.swift.org/swift-book/LanguageGuide/BasicOperators.html#ID71
