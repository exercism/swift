# Introduction

Functions in Swift are also values that are associated with a name, though they are defined using a different syntax from constants and variables. They are defined using the `func` keyword followed by a pair of parentheses enclosing a comma-separated list of parameter names along with their explicit types and an external name to be used by the caller of the function. The parameter list is followed by `->` and the type of the values returned by the function. Finally, this is followed by the body of the function enclosed in a pair of curly braces. For example:

```swift
func add10(to x: Int) -> Int {
  return x + 10
}
```

Invoking a function is done by specifying its name and passing arguments for each of the function's parameters using the external parameter name.

```swift
let fifteen = add10(to: 5)
```
