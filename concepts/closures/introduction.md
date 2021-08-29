# About

Closures in Swift are self-contained blocks of code that can be passed parameters to trigger their computation and return values. Closures also capture values from their environment and use them in their computations. As they are self contained, they may be passed around in a program like other values or assigned to constants and variables.

While functions in Swift are technically closures, when people refer to "closures" in Swift, they are referring to closure expressions. Closure expressions are written as a parameter list followed by a return type and the keyword `in` followed by the body of the closure, all contained in a pair of curly braces:

```swift
{ (a: Double, b: Double) -> Double in
  return a + b / 2.0
}
```
