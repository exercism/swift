# Introduction

Swift has a set of statements that can be used to alter the normal control flow of loops.
These are known as control transfer statements.
And you have already seen one of them, `return`, but this concept will introduce the other onces, which iclude `continue`, `break`, `fallthrough`, and labels.

## continue

Sometimes it is necessary to skip to the next iteration of a loop early, without completing the rest of the statements in the current iteration of the loop.
The `continue` keyword can be used for this.
When `continue` is executed, the loop jump to the next check to see if the next iteration of the loop can be run, i.e. the `while` in while and repeat-while loops or the check if there's another element in the sequence in for-in loops.

```swift
count = 1
while count < 6 {
  count += 1
  if count == 4 { continue }
  print(count)
}

// prints:
// 2
// 3
// 5
```

## Break

Break is used to exit a loop early.
When `break` is executed, the loop will immediately exit and the program will continue with the first statement after the loop.

```swift
for fruit in ["banana", "grapes", "apple", "strawberry", "kiwi", "lemon"] {
  if !fruit.count.isMultiple(of: 2) { break }
  print(fruit)
}

// prints:
// banana
// grapes
```

## Labels

When loops are nested, there are times when one may want to use `break` or `continue` to exit or restart the outer loops that contain the loop in which the `break` or `continue` are used.
In cases like these, labels may be used to specify the loop to be exited or restarted.
A loop can be labeled by putting a name followed by a colon before the `while`, `repeat`, or `for` that starts the loop.

To see the effect of using labels in this way, consider the following loop.

```swift
outerLoop: for fruit in ["banana", "grapes", "apple", "strawberry", "kiwi", "lemon"] {
  print("\n--- \(fruit) ---")
  for letter in fruit {
    guard letter != "n" else { break outerLoop }
    print(letter)
  }
}

// prints:
// --- banana ---
// b
// a
```

## Fallthrough

The `fallthrough` keyword is used to fall through to the next case in a switch statement.
Meaning that the code in the next case will be executed, even if the value in the next case does not match the value being compared.
This will make the switch statement behave like other programming languages where the `break` statement is not required to exit the switch statement after a case is matched.
You can read more about `fallthrough` in the [Swift book][fallthrough].

```swift
let value = 1
switch value {
case 1:
  print("One")
  fallthrough
case 2:
  print("Two")
}

// prints:
// One
// Two
```

[control-transfer]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Control-Transfer-Statements
[fallthrough]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Fallthrough
