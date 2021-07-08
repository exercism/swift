# Introduction

If the types of the parameters can be inferred, Swift also allows he parameter names and the keyword `in` to be omitted from the closure definition. the parameters can instead be referred to using a special shorthand syntax, where `$0` refers to the first parameter, `$1` refers to the second, and so on.

```swift
let mean: (Double, Double) -> Double = { $0 + $1 / 2.0 }

["apple", "ball", "carrot"].sorted(by: { $0.count < $1.count })
```
