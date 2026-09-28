# Introduction

Swift provides a built-in type called [`Bool`][bools] to represent truth values: `true` and `false`.

## Logical Operators

Swift provides three [logical operators][logical-operators] (`!`, `&&`, and `||`) to combine and evaluate Boolean expressions.

### Logical AND (`&&`)

The [_and_ operator][and] (`&&`) returns `true` only if both operands are `true`.
If either operand is `false`, it returns `false`.
Place an expression or Boolean value on each side of the `&&` symbol:

```swift
true && true  // true
true && false // false
```

### Logical OR (`||`)

The [_or_ operator][or] (`||`) returns `true` if **at least one** of the operands is `true`.
It returns `false` only when both operands are `false`.
Place an expression or Boolean value on each side of the `||` symbol:

```swift
true || true   // true
true || false  // true
false || false // false
```

### Logical NOT (`!`)

The [_not_ operator][not] (`!`) inverts a Boolean value.
It returns `true` if the value is `false`, and `false` if the value is `true`.
Place the `!` operator immediately before the value or expression:

```swift
!true  // false
!false // true
```

## Using Parentheses (`()`)

You can use [parentheses][explicit-parentheses] to group expressions and control the order of evaluation.
In Swift, expressions inside parentheses are evaluated first:

```swift
true && false && false || true   // true
true && false && (false || true) // false
```

Grouping with parentheses also determines how the NOT operator applies to complex expressions:

```swift
!true && false   // false (evaluates (!true) first, then false && false)
!(true && false) // true  (evaluates (true && false) first to false, then !false)
```

~~~~exercism/note
Use parentheses when you need to clarify evaluation order or make complex conditions easier to read.
Avoid adding unnecessary parentheses when the default precedence is already clear.
~~~~

[logical-operators]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Logical-Operators
[not]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Logical-NOT-Operator
[and]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Logical-AND-Operator
[or]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Logical-OR-Operator
[explicit-parentheses]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Explicit-Parentheses
[bools]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Booleans
