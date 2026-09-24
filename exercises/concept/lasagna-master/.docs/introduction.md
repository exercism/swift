# Introduction

## Default parameter values

[Default parameter values][default-parameter-values] can be supplied for any of a function's parameters by assigning a value to the parameter in the parameter list following the parameter's type annotation. When a default parameter value is specified, the caller of the function can omit that parameter when calling the function and the default value will be used instead.

```swift
func greeting(name: String = "guest", duration: Int = 2) -> String {
  "Welcome, \(name). Enjoy your \(duration) night stay."
}

greeting(name: "Bobo", duration: 7)
// Returns "Welcome, Bobo. Enjoy your 7 night stay."
greeting(duration: 3)
// Returns "Welcome, guest. Enjoy your 3 night stay."
greeting(name: "Wynona")
// Returns "Welcome, Wynona. Enjoy your 2 night stay."
greeting()
// Returns "Welcome, guest. Enjoy your 2 night stay."
```

## Variadic parameters

[_Variadic parameters_][variadic-parameters] in Swift allow zero or more values of the same type to be passed into a single parameter in a function. This is indicated by appending `...` to the type annotation of the parameter.

These values will be automatically grouped into an array with elements of the same type as the type of the variadic parameter.

```swift
func geometricMean(_ numbers: Double...) -> Double {
  var total = 1.0
  for number in numbers {
      total *= number
  }
  return pow(total, 1.0 / Double(numbers.count))
}

geometricMean(1, 2, 3, 4, 5)
// => 2.605171084697352
```

Note that when using variadic parameters, Swift has a limitation.
If a function has parameters that follow the variadic parameter in the definition, the first parameter following the variadic parameter is _required_ to have an argument label.

## In-out parameters

Within the body of a function, parameters are treated as constants, not variables; trying to modify the value of a parameter will raise a compile-time error.
If a function wishes to modify the value of a parameter, it must use an [_in-out parameter_][in-out-parameters] to make this mutability explicit.

To use in-out parameters, a programmer must be sure of three things:

1. The function definition must explicitly mark in-out parameters by writing the keyword `inout` between the `:` and the type name in the parameter's type annotation.
2. The value passed in to the in-out parameter must be declared as a variable, not a constant. Similarly it cannot be a literal.
3. The variable name must be preceded by an `&` in the call to the function, explicitly marking it as modifiable.

When this is done, the function will make an internal copy of the in-out parameter, modify it as directed in the body of the function and then copy the modified value back into the variable that was passed in when the function returns.

```swift
func updateVersion(_ record: inout (version: Int, title: String)) {
  record.version += 1
}

var dbRecord = (version: 2, title: "Exercism")
updateVersion(&dbRecord)

// dbRecord is now (3, "Exercism")
```

~~~~exercism/warning
There are a couple of extra rules one should be aware of regarding in-out parameters.

1  Inside a function with in-out parameters, you are not allowed to reference the variable that was passed in as the in-out parameter.
2. The same variable cannot be passed as multiple in-out parameters in the same function.
   For example, `inoutFunc(&mutVar, &mutVar)` raises a compiler error.
~~~~

## Nested functions

In Swift, you can define [functions inside other functions][nested-functions].
These are known as **nested functions**.

Nested functions are commonly used as private helpers that perform specific tasks for the enclosing function without cluttering the outer scope:

```swift
func makeNumber(_ number: Int) -> Int {
    func double(_ x: Int) -> Int {
        x * 2
    }

    func increment(_ x: Int) -> Int {
        x + 1
    }

    return number.isMultiple(of: 2) ? increment(double(number)) : double(number)
}

print(makeNumber(3)) // Prints 6
print(makeNumber(4)) // Prints 9
```

Nested functions behave like standard functions, but their visibility is restricted to the enclosing function's body.


[nested-functions]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/#Nested-Functions
[default-parameter-values]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/#Default-Parameter-Values
[variadic-parameters]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/#Variadic-Parameters
[in-out-parameters]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/declarations/#In-Out-Parameters
