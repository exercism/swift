# About

A [switch statement][switch] allows you to compare a value against multiple possible matching values.
It allows you to write more concise code than using multiple `else-if` statements.
A switch statement starts with the `switch` keyword followed by the value to be compared.
Then do define the cases using the `case` keyword followed by the value to be compared against.
The `default` keyword is used to define the default case when none of the cases match.
Like `else-if` statements, `switch` statements can execute the first matching case and then exit the switch statement.

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

## Binding and where statements

The values being matched in `switch` statements can also be bound to names which can be used in the body of the case.
They can also be used in `where` clauses, which are additional boolean expressions that must evaluate as `true` for the case to match.

```swift
let x = 1337
switch sumOfDivisors(of: x) {
case let total where total == x:
  print(total, "is a perfect number")
default:
  print(x, "is not a perfect number")
}
```

[switch]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Switch
