# About

## Getting Started

### Variables

Values can be associated with names by defining a [variable][constants-variables] and assigning a value to that variable.
That name may then be used to refer to that value throughout the program.
Variables are _mutable_, which means that the value can be changed at any time.

Variables are defined using the `var` keyword.

```swift
var variableName = 10
```

Swift is a type-safe, statically typed language, which means all values have a type at compile time.
You can either explicitly specify the type of a variable or let the compiler [infer the type][type-infering] based on the assigned value.

When assigning a value to a variable are there two ways either through explicit typing through [type annotations][type annotations] or implicit typing.

```swift
var explicitVar: Int = 10 // Explicitly typed
var implicitVar = 10      // Implicitly typed
```

Updating a variable's value is done using the `=` operator.

````exercism/note
The type of a variable, is fixed once it is initially defined.

```swift
variableName = 13 // update to new value

// compiler error when assigning a different type
variableName = "Hello, world!" // Cannot assign value of type 'String' to type 'Int'
```
````

Variables may be declared without assigning a value by specifying the name and type, but they may not be used before a value is assigned.

```swift
var someInt: Int

// This would trigger a compiler error
// print(someInt) // Variable 'someInt' used before being initialized

// Assign a value to the names
someInt = 169

print(someInt) // Prints '169'
```

### Constants

[Constants][constants-variables] are similar to variables in that they are associated with a name and a value, but the value of a constant cannot be changed once it is initially assigned and is thereby _immutable_.
Constants are defined using the `let` keyword.

```swift
let constantName = 10          // constant
let explicitConstant: Int = 10 // Explicitly typed constant
```

### Addition & Subtraction & Multiplication

Swift has [operators][operators] for addition, subtraction, and multiplication.
The operators are `+`, `-`, and `*` respectively.
  
```swift
print(1 + 1) // Prints 2
print(2 - 1) // Prints 1
print(2 * 2) // Prints 4
```

### Functions

In Swift, [functions][functions] are a chunk of code that performs a task.
A function has a return type and can thereby be used as a value and be parsed as arguments to other functions.
In Swift are functions defined using the `func` keyword followed by the name of the function, arguments separated by commas, and a return type.

The arguments are defined by an argument label, a parameter name followed by a semi-colon and then a type.
The return type is defined by a `->` followed by the type of the return value.

```swift
func functionName(argumentName parameterName: ArgumentType) -> ReturnType {
  // function body
}
```

Swift arguments are a bit special compared to other languages, they use [argument labels][argument labels].
The argument label is used when calling the function.
The parameter name is used inside the function body to refer to the argument value.
If you only assign one name to the argument it will be used as both the argument label and the parameter name.
When assigning the argument label name as: `_` so will the argument not have a label when calling the function, e.g: `functionName(argumentValue)`

To call a function you use the function name followed by the argument label and the argument value, like this:

```swift
func functionName(argumentLabel parameterName: ArgumentType) -> ReturnType {
  // function body
}

// calling the function
functionName(argumentLabel: argumentValue)
```

All arguments are immutable by default and can't be changed inside the function.
When a function has a return type most be sure to return a value of that type.
That is done by using the `return` keyword followed by the value to return.

```swift
func addTen(number value: Int) -> Int {
  return value + 10
}

// calling the function
addTen(number: 10) // Returns 20
```

When functions don't return a value they have a return type of `Void`, which is the same as `()`, but the return type can also be omitted in these cases.

### Comments

Swift supports two types of [comments][comments].
Single line comments are preceded by `//` and multiline comments are inserted between `/*` and `*/`.

[comments]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Comments
[constants-variables]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Constants-and-Variables
[type annotations]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Type-Annotations
[type-infering]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics#Type-Safety-and-Type-Inference
[functions]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/#Defining-and-Calling-Functions
[arithmetical-operators]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Arithmetic-Operators
