# Introduction

The `guard` statement in Swift is used for early exits from functions, loops, or methods when a required condition is not met:

```swift
guard myValue >= 0 else { return 0 }
let root = myValue.squareRoot()
```

In the example above, `guard` evaluates the Boolean expression that follows it.
If the condition is `true`, execution continues with the code after the `guard` statement.
If the condition is `false`, the code inside the `else` block executes.

Unlike an `if` statement:

- A `guard` statement **must** include an `else` clause.
- The `else` clause **must** transfer control to exit the surrounding scope (for example, by using `return`, `continue`, `break`, or throwing an error).

`guard` is often used to validate preconditions cleanly.
For example, consider the sinc function ($\text{sinc}(x) = \frac{\sin(x)}{x}$, with $\text{sinc}(0) = 1$ to avoid dividing by zero):

```swift
func sinc(_ x: Double) -> Double {
    guard x != 0 else { return 1 }
    return sin(x) / x
}

sinc(0)             // returns 1
sinc(Double.pi / 2) // returns 0.6366197723675814
```
