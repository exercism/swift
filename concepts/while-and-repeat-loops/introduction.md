# About

A [while loop][while-loops] is a control flow statement that allows code to be executed while a certain condition is true.
Swift provides two kinds of while loops: while and repeat-while loops.
While loop's condition is evaluated before the loop body is executed; if the condition is false, the loop body will not be executed at all.
while-loops in Swift have the following structure:

```swift
while <#condition#> {
  <#code#>
}
```

Here the loop will exectute as long as count is greater than 0, and will thereby print the numbers 2, 1 and "Liftoff!".

```swift
var count = 2
while count > 0 {
  print("\(count)…")
  count -= 1
}
print("Liftoff!")

// prints:
// 2…
// 1…
// Liftoff!
```

A [repeat-while loop][while-loops] is similar to a while loop, but the condition is evaluated after the loop body is executed.
This means that the loop body will always execute at least once, even if the condition is false.
repeat-while loops in Swift have the following structure:

```swift
repeat {
  <#code#>
} while <#condition#>
```

Here the loop will only execute once, since the condition is false.
Since it is a repeat-while loop, the loop body will execute once before the condition is evaluated.

```swift
var count = 2
repeat {
  print("\(count)…")
} while count < 0
print("Liftoff!")
```

[while-loops]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#While-Loops
[repeat-loops]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Repeat-While
