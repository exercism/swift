# Introduction

[Variadic parameters][variadic-parameters] allow a function to accept zero or more values of a specified type for a single parameter.
You define a variadic parameter by appending three dots (`...`) to the parameter's type annotation.

Inside the function body, Swift makes these values available as an array of the specified type:

```swift
import Foundation

func geometricMean(_ numbers: Double...) -> Double {
    var total = 1.0
    for number in numbers {
        total *= number
    }
    return pow(total, 1.0 / Double(numbers.count))
}

let result = geometricMean(1, 2, 3, 4, 5)
// result is 2.605171084697352
```

~~~~exercism/note
If a function includes additional parameters after a variadic parameter, the first parameter following the variadic parameter **must** have an explicit argument label so Swift knows where the variadic argument list ends.
~~~~

[variadic-parameters]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/#Variadic-Parameters
