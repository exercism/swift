# About

Values can be associated with names by defining a variable and assigning a value to that variable. That name may then be used to refer to that value throughout the program. As the name implies, a variable is _mutable_, which means that the value can be changed at any time.

Variables are defined using the `var` keyword

```swift
var variableName = 10
```

The type associated with a variable can be either explicitly specified, or it can be inferred by the compiler based on the assigned value. Therefore, the following two variable definitions are equivalent:

```swift
var explicitVar: Int = 10 // Explicitly typed
var implicitVar = 10 // Implicitly typed
```

Updating a variable's value is done using the `=` operator. Note that the type of that variable, however, is fixed once it is initially defined and like the value associated with a constant, cannot be changed.

```swift
variableName = 13 // update to new value

// compiler error when assigning different type
variableName = "Hello, world!" // Cannot assign value of type 'String' to type 'Int'
```

Variables may be declared without assigning a value by specifying the name and type, but they may not be used before a value is assigned.

```swift
var someInt: Int

// This would trigger a compiler error
// print(someInt) // Variable 'someInt' used before being initialized

// Assign a value to the names
someInt = 169

print(someInt) // prints '169'
```
