# About

Swift provides control transfer statements to alter the execution flow of loops and switch statements.
In addition to `return`, Swift includes `continue`, `break`, loop labels, and `fallthrough`.

## Continue

The `continue` statement tells a loop to stop executing the current iteration and begin the next iteration immediately.
In a `while` or `repeat-while` loop, it jumps straight to the condition check.
In a `for-in` loop, it advances to the next element in the sequence.

```swift
var count = 1
while count < 6 {
    count += 1
    if count == 4 {
        continue
    }
    print(count)
}

// Prints:
// 2
// 3
// 5
// 6
```

## Break

The `break` statement exits an entire loop or switch statement immediately.
Execution resumes at the first line of code following the loop or switch.

```swift
for fruit in ["banana", "grapes", "apple", "strawberry", "kiwi", "lemon"] {
    if !fruit.count.isMultiple(of: 2) {
        break
    }
    print(fruit)
}

// Prints:
// banana
// grapes
```

## Labeled Statements

In nested loops, you may want `break` or `continue` to affect an outer loop rather than the innermost loop.
You can label a loop by prefixing it with a name and a colon (`labelName:`).
You can then pass that label to `break` or `continue`:

```swift
outerLoop: for fruit in ["banana", "grapes", "apple", "strawberry", "kiwi", "lemon"] {
    print("\n--- \(fruit) ---")
    for letter in fruit {
        guard letter != "n" else {
            break outerLoop
        }
        print(letter)
    }
}

// Prints:
// --- banana ---
// b
// a
```

## Fallthrough

In Swift, `switch` statements do not fall through to the next case by default; execution automatically stops at the end of the matched case.
If you explicitly want execution to continue into the next case without evaluating its pattern, use the `fallthrough` keyword:

```swift
let value = 1
switch value {
case 1:
    print("One")
    fallthrough
case 2:
    print("Two")
default:
    break
}

// Prints:
// One
// Two
```

For more details, see the [Swift documentation on control transfer statements][control-transfer] and [fallthrough][fallthrough].

[control-transfer]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Control-Transfer-Statements
[fallthrough]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Fallthrough
