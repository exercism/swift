# Introduction

While loops in Swift have the following structure:

```swift
while boolean-expression {
  loop-body
}
```

The loops begin by first evaluating a Boolean expression. If the expression evaluates to `false`, then the body of the loop is skipped and execution begins on the first line following the loop. If the condition evaluates to `true`, then the body of the loop is executed, after which the Boolean expression is evaluated again, repeating this way until the Boolean expression evaluates to false.

```swift
var count = 3
while count > 0 {
  print("\(count)…")
  count -= 1
}
print("Liftoff!")

// prints:
// 3…
// 2…
// 1…
// Liftoff!
```
