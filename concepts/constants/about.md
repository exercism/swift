# About

Values can be associated with names by defining a constant and assigning a value to the constant. That name may then be used to refer to that value throughout the program. As the name implies, a constant is _immutable_ which means that the value cannot be changed.

Constants are defined using the `let` keyword.

```swift
let constantName = 10 // constant
```

The type associated with a constant can be either explicitly specified, or it can be inferred by the compiler based on the assigned value. Therefore, the following two variable definitions are equivalent:

```swift
let explicitVar: Int = 10 // Explicitly typed
let implicitVar = 10 // Implicitly typed
```

Constants may be declared without assigning a value by specifying the name and type, but they may not be used before a value is assigned.

```swift
let someString: String

// This would trigger a compiler error
// print(someString) // Constant 'someString' used before being initialized

// Assign a value to the names
someString = "Finally! A value."

print(someString) // prints 'Finally! A value.'
```
