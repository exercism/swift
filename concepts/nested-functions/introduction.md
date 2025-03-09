# Nested functions

Functions may be defined [inside of other functions][nested-functions].
This is commonly used to create helper functions which are only useful to their enclosing function and so don't need to pollute the outside namespace.

These functions are defined and called just like normal functions, but are not visible outside the enclosing function.

```swift
func makeNumber(_ number: Int) -> Int {
  func double(_ x: Int) -> Int { 2 * x }
  func add(_ x: Int) -> Int { x + 1 }

  return number.isMultiple(of: 2) ? add(double(number)) : double(number)
}

makeNumber(3)
// Returns 6
makeNumber(4)
// Returns 9
```

[nested-functions]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/#Nested-Functions
