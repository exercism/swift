# Introduction

## Getting Started

### Variables

You can store and name values by defining a [variable][constants-variables].
After defining a variable, you can use its name to refer to that value throughout your code.
Variables are _mutable_, which means their values can change after they are defined.

Define a variable with the `var` keyword:

```swift
var variableName = 10
```

Swift is a statically typed language, which means every value has a known type at compile time.
You can explicitly declare a type with a [type annotation][type annotations], or you can let the Swift compiler [infer the type][type-inferring] from the assigned value:

```swift
var explicitVar: Int = 10 // Explicitly typed
var implicitVar = 10      // Implicitly typed (inferred as Int)
```

You can update a variable's value using the assignment operator (`=`):

~~~~exercism/note
A variable's type cannot change after it is declared.

```swift
variableName = 13 // Allowed: same type (Int)

// Compiler error: cannot assign a different type
variableName = "Hello, world!" // Cannot assign value of type 'String' to type 'Int'
```
~~~~

You can declare a variable without an initial value by specifying its type, but you must assign a value before using it:

```swift
var someInt: Int

// This triggers a compiler error:
// print(someInt) // Variable 'someInt' used before being initialized

// Assign a value first
someInt = 169
print(someInt) // Prints 169
```

### Constants

[Constants][constants-variables] also associate a name with a value, but their values cannot be changed after assignment.
They are _immutable_.
Define a constant using the `let` keyword:

```swift
let constantName = 10          // Inferred constant
let explicitConstant: Int = 10 // Explicitly typed constant
```

### Arithmetic Operators

Swift provides standard [arithmetic operators][arithmetical-operators] for basic math:

- Addition: `+`
- Subtraction: `-`
- Multiplication: `*`

```swift
print(1 + 1) // Prints 2
print(2 - 1) // Prints 1
print(2 * 2) // Prints 4
```

### Functions

In Swift, [functions][functions] are self-contained blocks of code that perform a specific task.
Functions can accept inputs, return a value, and be passed around as values to other functions.
Define a function using the `func` keyword, followed by the function name, a parameter list in parentheses, and an optional return type:

```swift
func functionName(argumentLabel parameterName: ParameterType) -> ReturnType {
    // Function body
}
```

Swift functions use [argument labels][argument-labels], which make code read like natural sentences:

- The **argument label** is used when calling the function.
- The **parameter name** is used inside the function body to access the value.

If you specify only one name, Swift uses it as both the argument label and the parameter name:

```swift
func greet(name: String) {
    print("Hello, \(name)!")
}

greet(name: "Alice")
```

If you do not want an argument label when calling the function, write an underscore (`_`) before the parameter name:

```swift
func square(_ number: Int) -> Int {
    return number * number
}

square(5) // Called without an argument label
```

All function parameters are constants (`let`) by default, meaning their values cannot be modified inside the function body.

To return a value from a function, specify the return type after `->` and use the `return` keyword:

```swift
func addTen(to value: Int) -> Int {
    return value + 10
}

addTen(to: 10) // Returns 20
```

When a function does not return a value, its return type is `Void` (equivalent to an empty tuple, `()`).
You can omit both the `-> Void` return type and the `return` statement in such functions.

### Comments

Swift supports two forms of [comments][comments]:

- **Single-line comments** start with `//` and continue to the end of the line.
- **Multiline comments** are enclosed between `/*` and `*/`.

```swift
// This is a single-line comment

/* This is a comment
   that spans multiple lines */
```

[comments]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Comments
[constants-variables]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Constants-and-Variables
[type annotations]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Type-Annotations
[type-inferring]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Type-Safety-and-Type-Inference
[functions]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/#Defining-and-Calling-Functions
[arithmetical-operators]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Arithmetic-Operators
[argument-labels]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/#Function-Argument-Labels-and-Parameter-Names
