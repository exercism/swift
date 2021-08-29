# About

[Structs and classes][structs-and-classes] are two of the primary building blocks of Swift programming. They are both means of grouping together related data and functions into self-contained units of functionality. All of the basic types that you have been working with up to this point, such as `Int`, `Double`, and `Character` as well as collection types like `Array`, `String`, and `Dictionary` are actually structs. And when you define a struct or class, you are defining a new type to be used within Swift, just as you used those types.

There are many similarities between structs and classes in Swift. Among other similarities, both are able to store values in _properties_ and provide functionality through the use of _methods_.

They each provide some additional functionality, which is out of scope for this exercise.

## Defining structs

A struct is defined using the `struct` keyword followed by the type name that is being defined, then the body, placed between curly braces.

The body may consist of stored properties, which are defined and behave just like regular constants or variables.

```swift
struct CharacterStats {
  var health = 0.0
  var speed = 0
  var strength = 0
}
```

## Instances

As noted above, defining a struct is just defining a new _type_. It is just the blueprint for what the values of that type will look like, but it does not actually create any values of that type for you to work with.

In order to create an _instance_ of that type, you need to write the name of the type followed by a pair of parentheses.

```swift
let someStats = CharacterStats()
```

This will create values of these types, where the properties are populated with the default values supplied in the definition.

With structs, Swift automatically provides something called a _memberwise initializer_, where values for the structs properties may be provided inside the parentheses which will override the default values in the definition.

```swift
let differentStats = CharacterStats(health: 100.0, speed: 6, strength: 18)
```

## Accessing properties

Struct properties can be accessed using _dot notation_ where the name of the value is followed by a dot (`.`) and the name of the property. If a property of a struct has properties of its own, this dot notation can be used to access these nested properties as well.

This notation can be used both to retrieve the property's value and, where allowed, to change it.

```swift
someStats.health
// => 0
someStats.health = 87.3
someStats.health
// => 87.3
```

[structs-and-classes]: https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
