# About

The [ternary conditional operator][ternary-operator] is a concise shorthand for an `if-else` expression.
It evaluates a condition and returns one of two values depending on whether that condition is `true` or `false`.

The operator uses three parts: `condition ? trueExpression : falseExpression`.
If `condition` evaluates to `true`, `trueExpression` is evaluated and returned; otherwise, `falseExpression` is evaluated and returned.

The ternary operator is ideal for simple, one-line choices:

```swift
let showFahrenheit = true
let temperatureInCelsius = 30

let temperature = showFahrenheit ? temperatureInCelsius * 9 / 5 + 32 : temperatureInCelsius
print(temperature)
// Prints 86
```

The example above is a compact equivalent to:

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
