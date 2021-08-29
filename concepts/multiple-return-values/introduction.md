# Introduction

Multiple values can be returned from Swift functions by creating and returning a tuple from the different values.

```swift
func reverseAndLength(_ str: String) -> (reverse: String, length: Int) {
  return (reverse: str.reverse, length: str.count)
}

reverseAndLength("Hello")
// => (reverse: "olleH", length: 5)
```
