# About

A [switch statement][switch] allows you to compare a value against multiple possible matching values.
It allows you to write more concise code than using multiple `else-if` statements.
Switch statement starts with the `switch` keyword followed by the value to be compared.
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

Could instead be written as:

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

[switch]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Switch
