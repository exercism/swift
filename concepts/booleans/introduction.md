# Introduction

One of Swift's basic types is the Boolean type, called `Bool`. Swift provides two Boolean constant values, `true` and `false`:

```swift
let doEaglesFly = true
let doElephantsFly = false
```

Expressions that evaluate to Boolean values are known as _Boolean Expressions_. Some of the most common Boolean expressions are those built using comparison operators:

```swift
1 + 1 == 2   // evaluates to true
3 + 3 < 5    // evaluates to false
10 >= 10     // evaluates to true
```

Boolean Expressions can be combined using Swift's logical operators:

```swift
2 + 2 == 4 && 6 / 2 <= 2  // evaluates to false
4 > 5 || 1 != 0           // evaluates to true
!(2 * 2 == 2 + 2)         // evaluates to false
```

Note that unlike some languages, Swift doesn't have an logical exclusive-or operator; the `!=` comparison operator is used instead.

```swift
true != true                  // evaluates to false
(1 == 2) != (7 - 4 == 15 / 5) // evaluates to true
```
