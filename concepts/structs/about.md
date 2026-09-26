# About

[Structures][structs-and-classes] (commonly called *structs*) are one of the primary building blocks of Swift programs.
Structs allow you to create custom types that group related properties (data) and methods (behavior) together.
In fact, Swift's standard types, including `Int`, `Double`, `Bool`, `String`, `Array`, and `Dictionary`, are all implemented as structs.

## Defining Structs

Define a struct using the `struct` keyword, followed by the type name and curly braces containing its definition.
By Swift convention, struct names use `UpperCamelCase`:

```swift
struct CharacterStats {
    var health = 0.0
    var speed = 0
    var strength = 0
}
```

## Creating Instances

A struct definition is a blueprint.
To create an *instance* of a struct, call its initializer by writing the type name followed by parentheses:

```swift
var someStats = CharacterStats()
```

This creates an instance populated with the default property values from the definition.

Swift also generates an automatic **memberwise initializer** for structs, which allows you to initialize properties by name:

```swift
let customStats = CharacterStats(health: 100.0, speed: 6, strength: 18)
```

## Accessing and Modifying Properties

You access and modify an instance's properties using *dot notation*:

```swift
var stats = CharacterStats()

print(stats.health) // Prints 0.0

stats.health = 87.3
print(stats.health) // Prints 87.3
```

Because structs are value types, modifying an instance's properties requires the instance itself to be declared with `var`.
If the instance is declared with `let`, all of its properties become immutable.

[structs-and-classes]: https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
