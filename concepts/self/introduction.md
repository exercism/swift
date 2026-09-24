# Introduction

Every instance of a struct or class has an implicit property named `self`, which refers to the instance itself.
The most common use of `self` is to disambiguate between an instance property and a parameter that shares the same name:

```swift
struct Position {
    var x = 0

    mutating func move(x: Int) {
        // Here, 'self.x' refers to the struct's property,
        // while 'x' refers to the parameter passed to the method.
        self.x = x
    }
}
```

Swift types also provide a capitalized `Self` keyword, which refers to the *type* of the instance rather than the instance itself.
