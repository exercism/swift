# Introduction

Functions may be defined inside of other functions, which are known as _nested-functions_.

These functions are defined and called just like normal functions, but are not visible outside the enclosing function.

```swift
func double(_ x: Int) -> Int {
  func add(_ x: Int, y: Int) -> Int { x + y }

  add(x, x)
}
```
