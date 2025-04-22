# About

## Optionals

Swift uses [_optionals_][optionals] to allow programmers to represent the possible absence of a value.
Optionals is a type that can either hold a value or be [`nil`][nil], which represents the absence of a value.
Before attempting to use a value that may not exist, optionals allow the program to check first it it exists, then if it does exist unwrap and use it.

Any type can be made into an optional by appending a `?` onto the end of the type name.
So an optional integer would have type `Int?` and an optional string would have type `String?`.
Defining constants or variables of optional type and assigning them values is done the same as for values of non-optional types.

```swift
let x: Int? = 42
var y: String? = "Hello"
y = "Goodbye"
```

You can assign the absence of a value to a variable of optional type by assigning it the special value `nil`.
`nil` can be used with all optional types, but `nil`s assigned to two different optional types do not have the same type, and cannot be interchanged or even compared.

```swift
let intOpt: Int? = nil
let stringOpt: String? = nil

intOpt = stringOpt
// Compiler error: Cannot assign value of type 'String?' to type 'Int?'

intOpt == stringOpt
// Compiler error: Binary operator '==' cannot be applied to operands of type 'Int?' and 'String?'
```

Also note that even though `nil` can be assigned to any optional type, it cannot be assigned to a non-optional type (even if it doesn't actually hold `nil`).
And methods that is expecting a non-optional type cannot be passed an optional type without unwrapping it first.

```swift
var x: Int = 42
var y: Int? = 42

y = x
// Works fine
x = y
// error: value of optional type 'Int?' must be unwrapped to a value of type 'Int'
x + y
// error: value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

## Using optionals

Because optional types are not the same types as their base types, the two types cannot be used in the same ways.
For example: `Int("123") + 1` results in a compiler error "Value of optional type 'Int?' must be unwrapped to a value of type 'Int'".
This is because the `Int("123")` returns an optional `Int?` type, not an `Int` type, since if the string cannot be converted to an integer, the result will be `nil`.
In order to access the `Int` from the conversion, one must "unwrap" it first.

This is most commonly done in Swift using the `if-let` and `guard-let` constructs for [_optional binding_][optional-binding] which check for `nil` and take one code path with the unwrapped value bound to a supplied name if a value exists and taking a different code path if `nil` was found.

```swift
if let safeNum = Int("123") {
	let sum = safeNum + 1
	…
} else {
  // code for the case where nil was found -- may be left out
}
```

It is worth noting that the `safeNum` variable has the type `Int` and not `Int?`.
In the example below, `num` is of type `Int?` and `safeNum` is of type `Int`.

```swift
let num = Int("123")
if let safeNum = num {
  // num is of type Int
}
```

This _optional binding_ is important because it unwraps (or "removes") the optional type from the value, allowing it to be used as a non-optional value.
If you would just do a conditional check on if the value is `nil`, the value would still be of optional type:

```swift
let num = Int("123")
if num != nil {
  // num is of type Int?
}
```

The `guard-let` option may also be used in the cases where early return is desired:

```swift
guard let num = Int("123") else { return nil }
let sum = num + 1
…
```

## Comparing optionals

Note that even if the base type of a pair of optionals can be compared using the standard comparison operators, the optionals themselves cannot be compared.
They can only be checked for equality.
Two optionals are equal if they are both `nil` or if the values they wrap are equal within their base types.

However, code can be written to perform a custom comparison of two optional values.
Below is an example of a `switch` statement that will return `true` only if both optional values are non-nil and the first value is less than the second. 
To do this it uses the _optional pattern_ `varName?` which only matches non-nil optionals, binding the value inside the optional to the name `varName`:

```swift
switch (optionalA, optionalB) {
case let (valA?, valB?): return valA < valB
default: return false
}
```

## Nil coalescing

Another option for unwrapping exists where it is possible to use a [fallback value][fallback] if `nil` is present.
This can be done by using the _nil coalescing operator_, `??`. Assuming `x` is an `Int?`, if one writes `let y = x ?? 0`, then Swift will check if x is `nil`.
If it is not, then it will unwrap `x` and assign the unwrapped value to `y`, and if `x` _is_ `nil`, then it will assign 0 to `y`.

Since `x ?? y` is simply shorthand for `x != nil ? x! : y`, if `x` is not nil, then the expression `y` is not evaluated at all.

Finally, it should be noted that the nil coalescing operator is right associative, which can lead to surprising results for the unaware.

```swift
let k = 42 ?? 0 + 1    // returns 42
let j = nil ?? 0 + 1   // returns 1
```

You can read further about the nil coalescing operator in [A Tour of Swift: Nil-Coalescing Operator][nil-coalescing].

[optionals]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Optionals
[nil]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#nil
[optional-binding]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Optional-Binding
[nil-coalescing]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Nil-Coalescing-Operator
[fallback]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Optional-Binding
