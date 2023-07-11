# Bools

Swift has a type known as [`Bool`][bools], it is used to represent the values `true` and `false`.

## Logical operators

Swift has 3 [logical operators (`!`, `||`, `&&`)][logical-operators] which are used to combine Bools and make expressions that produce different values.

### And(`&&`)

The [_and_ operator][and] in Swift is represented by `&&` and returns `true` if both values given are `true` otherwise it returns `false`.
When using the _and_ operator, one Bool be placed on the right side of the `&&` and another one on the left side.

```Swift
true && true  // true
true && false // false
```

### Or(`||`)

The [_or_ operator][or] in Swift is represented by `||` and returns `true` if **at least one** of values given is `true` if both of the values are `false` then it returns `false`.
When using the _or_ operator one bool should be placed on the right side of the `||` and another one on the left side.

```swift
true || true   // true
true || false  // true
false || false // false
```

### Not(`!`)

The [_not_ operator][not] in Swift is represented by `!` and returns `true` if the given Bool is `false` and returns `false` if `true` is given.
When using the _not_ operator one Bool should be placed after the operator (`!`).

```swift
!true  // false
!false // true
```

## Using parentheses(`()`)

When working with booleans you can use [explicit parentheses][explicit-parentheses] to decide which Bools to evaluate first.
The result can differ depending on how the parentheses are used.
In Swift, what is in parentheses is evaluated first.

```swift
true && false && false || true   // true
true && false && (false || true) // false
```

Since what is in parentheses is evaluated first, in the following example, the _not_ operator will apply to the expression inside parentheses.

```Swift
!true && false   // false
!(true && false) // true
```

```exercism/note
You should only use parentheses when they affect the result, otherwise, should they be omitted.
```

[logical-operators]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Logical-Operators
[not]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Logical-NOT-Operator
[and]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Logical-AND-Operator
[or]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Logical-OR-Operator
[explicit-parentheses]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Explicit-Parentheses
[bools]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Booleans
