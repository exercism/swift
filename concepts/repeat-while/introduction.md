# Introduction

[Repeat-while loops][repeat-loops] are similar to `while` loops, but with one key difference: the condition check occurs *after* the body of the loop executes rather than before.
As a result, a `repeat-while` loop is guaranteed to execute its code block at least once.

```swift
repeat {
    print("This runs at least once")
} while false

print("Loop done")

// Prints:
// This runs at least once
// Loop done
```

[repeat-loops]: https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html#ID126
