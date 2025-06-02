# Introduction
## Switch

A [switch statement][switch] allows you to compare a value against multiple possible matching values.
It allows you to write more concise code than using multiple `else-if` statements.
A switch statement starts with the `switch` keyword followed by the value to be compared.
Then you can define the cases using the `case` keyword followed by the value to be compared against.
The `default` keyword is used to define the default case when none of the cases match.
Like `else-if` statements, `switch` statements only execute the block of code associated with the first matching case.

```swift
switch value {
case 1:
    print("One")
case 2:
    print("Two")
default:
    print("Other")
}
```

Consider the following example:

```swift
if str == "apple" {
    print("Let's bake an apple crumble")
} else if str == "lemon" {
    print("Let's bake a lemon meringue pie!")
} else if str == "peach" {
    print("Let's bake a peach pie!")
} else {
    print("Let's buy ice cream.")
}
```

This could instead be written as:

```swift
switch str {
case "apple":
    print("Let's bake an apple crumble")
case "lemon":
    print("Let's bake a lemon meringue pie!")
case "peach":
    print("Let's bake a peach pie!")
default:
    print("Let's buy ice cream.")
}
```

## While loops

A [while loop][while-loops] is a control flow statement that allows code to be executed while a certain condition is true.
Swift provides two kinds of while loops: while and repeat-while loops.
While loop's condition is evaluated before the loop body is executed; if the condition is false, the loop body will not be executed at all.
While loops in Swift have the following structure:

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

## Control Transfer

Swift has a set of statements that can be used to alter the normal control flow of loops.
These are known as control transfer statements.
You have already seen `return`; this concept will introduce other, which include `continue`, `break`, and labels.
We won't cover `fallthrough` in this concept, but you can read about it in the [Swift book][fallthrough].

### Continue

Sometimes it is necessary to skip to the next iteration of a loop early, without completing the rest of the statements in the current iteration of the loop.
The `continue` keyword can be used for this.
When `continue` is executed, the loop jumps to the next check to see if the next iteration of the loop can be run, i.e. the `while` in while and repeat-while loops or the check if there's another element in the sequence in for-in loops.

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

### Break

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

### Labels

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

[control-transfer]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Control-Transfer-Statements
[fallthrough]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Fallthrough
[while-loops]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#While-Loops
[repeat-loops]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Repeat-While
[switch]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Switch