# Introduction

A [while loop][while-loops] executes a block of code repeatedly as long as a specified condition evaluates to `true`.
Swift provides two varieties of while loops: `while` and `repeat-while`.

## `while` Loops

In a `while` loop, the condition is evaluated *before* each pass through the loop.
If the condition is initially `false`, the loop body never executes:

```swift
var count = 2
while count > 0 {
    print("\(count)...")
    count -= 1
}
print("Liftoff!")

// Prints:
// 2...
// 1...
// Liftoff!
```

## `repeat-while` Loops

A [`repeat-while` loop][repeat-loops] evaluates its condition *after* the loop body runs.
This ensures the loop body executes at least once, even if the condition is `false` from the start:

```swift
var count = 2
repeat {
    print("\(count)...")
} while count < 0
print("Liftoff!")

// Prints:
// 2...
// Liftoff!
```

[while-loops]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#While-Loops
[repeat-loops]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Repeat-While
