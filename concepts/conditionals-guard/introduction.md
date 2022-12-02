# Introduction

The `guard` statement in swift is used for early returns from Swift functions when a necessary condition which needs to be met for further processing to continue is not met, e.g.:

```swift
guard myValue >= 0 else { return 0 }
let root = myValue.squareRoot()
```

Here, the `guard` checks if the Boolean expression following the `guard` keyword evaluates as true. If it does, then processing continues with the code following the guard statement (here `let root = myValue.squareRoot()`. Otherwise it will execute the code in the else clause. Unlike an `if` statement, a `guard` statement _must_ have an else clause, and unlike the else clause of an if-else, the else clause of a guard _must_ exit the scope of the guard statement. I.e. it must use a control transfer statement such as `return`, `continue`, `break`, or it must throw an error or exit the program.
