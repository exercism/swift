# Function overloading

Two functions are considered distinct in Swift if they have a different name, _or_ any of the following are true:

- They have differing number of parameters
- Any external argument labels are different
- The type of any parameters are different

The following functions are considered different and can be defined and used in the same program:

```swift
// Original definition
func add(_ x: Int, and y: Int, doubleResult: Bool) -> Int {
  // ...
}

// Different number of parameters
func add(_ x: Int, and y: Int) -> Int {
  // ...
}

// Different parameter type
func add(_ x: Double, and y: Int, doubleResult: Bool) -> Double {
    // ...
}

// Different argument label
func add(_ x: Int, and y: Int, doubleThat: Bool) -> Int {
    // ...
}
```

Functions are also considered distinct if just the return value changes, though in many cases, it is necessary to provide a hint to the compiler in the form of a type annotation so it knows which version of the function to call.
