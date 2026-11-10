# Introduction

## Optionals

Swift uses [_optionals_][optionals] to represent the possibility that a value may be absent.
An optional can either hold a wrapped value or contain [`nil`][nil], indicating no value is present.

To declare a type as optional, append a question mark (`?`) to the type name:

- `Int?` is an optional integer.
- `String?` is an optional string.

```swift
let x: Int? = 42
var y: String? = "Hello"
y = "Goodbye"
y = nil // y now holds no value
```

In Swift, `nil` is not a raw pointer; it represents the absence of a value for an optional type.
You cannot assign `nil` to a non-optional variable or constant:

```swift
var regularInt: Int = 42
var optionalInt: Int? = 42

optionalInt = regularInt // Allowed: Int can be wrapped in an optional Int?

// The following lines will not compile:
// regularInt = optionalInt // Error: Value of optional type 'Int?' must be unwrapped
// regularInt = nil         // Error: 'nil' cannot be assigned to type 'Int'
```

## Unwrapping Optionals

Because an optional is a wrapper around a value, you cannot use it directly in expressions expecting the underlying type.
For example, `Int("123")` returns an `Int?` because parsing may fail.
You must **unwrap** the optional before using its value.

### Optional Binding (`if let` and `guard let`)

Optional binding checks whether an optional contains a value.
If it does, Swift unwraps that value and binds it to a temporary constant or variable:

```swift
let possibleNumber = "123"

if let actualNumber = Int(possibleNumber) {
    print("Parsed number: \(actualNumber + 1)")
} else {
    print("Could not parse number from string.")
}
```

Inside the `if` block, `actualNumber` is a non-optional `Int`.

You can also use `guard let` for early exit:

```swift
func printNextNumber(_ text: String) {
    guard let number = Int(text) else {
        print("Invalid input.")
        return
    }
    print("Next number: \(number + 1)")
}
```

## Comparing Optionals

You can compare optionals for equality (`==` and `!=`):

- Two optionals are equal if both are `nil`, or if both contain values that are equal.
- A non-optional value can be compared to an optional of the same underlying type.

```swift
let a: Int? = 5
let b: Int? = 5
let c: Int? = nil

print(a == b) // Prints true
print(a == c) // Prints false
print(a == 5) // Prints true
```

[optionals]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Optionals
[nil]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#nil
