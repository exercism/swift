# Function overloading

Function overloading is when two functions have the same name (to indicate that they have very similar behavior) but operate on different parameters or produce their results differently.

Two functions are considered distinct in Swift if they have a different name, _or_ if any of the following are true:

- They have a different numbers of parameters
- Any _external_ argument labels are different
- The types of any parameters are different
- The return type is different
- (For generic functions) The constraints or requirements of any generic types are different
- One function is `async` and the other is not

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

// Different parameter types
func add(_ x: Double, and y: Double, doubleResult: Bool) -> Double {
    // ...
}

// Different argument label
func add(_ x: Int, and y: Int, doubleIt: Bool) -> Int {
    // ...
}

// Different generic types
func add<A, R>(_ x: A, and y: A, doubleThat: R) -> Int {
    // ...
}

// Different generic type constraints
func add<A: Equatable, R>(_ x: A, and y: A, doubleThat: R) -> Int {
    // ...
}

// Async version
func add(_ x: Int, and y: Int, doubleResult: Bool) async -> Int {
  // ...
}
```

Note that, while functions are considered distinct if just the return type or `async` property changes, in many cases it will be necessary to provide a hint to the compiler in the form of an explicit type annotation at the call site to clarify which version of the function should be called.

So, with all of the above functions defined, this code will not compile:
```
// Produces error: "Ambiguous use of 'add(_:and:doubleResult:)'"
let result = add(1, and: 2, doubleResult: false)
```

However, this code unambiguosly specifies which function is to be used:
```
let result: Double = add(1, and: 2, doubleResult: false)
```
