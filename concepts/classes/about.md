# About

Classes are a core building block of Swift programming. It provides a way to group together related data and functions into self-contained units of functionality.

### Defining classes

To define a class, start with the `class` keyword followed by the type name that is being defined, then the body of the class follows, placed between curly braces.

The body may consist of stored properties, which are defined and behave just like regular constants or variables.

```swift
class GameCharacter {
  var characterClass: String?
  var name: String?
  var active = false
  let id = makeRandomID()
}
```

### Instances

As noted above, defining a class is just defining a new _type_. It is just the blueprint for what the values of that type will look like, but it does not actually create any values of that type for you to work with.

In order to create an _instance_ of that type, you need to write the name of the type followed by a pair of parentheses.

```swift
let someCharacter = GameCharacter()
```

This will create values of these types, where the properties are populated with the default values supplied in the definition. Note that in optional cases like GameCharacter's `name` property, unless a value is provided, the property will default to nil, just like defining regular optional types where a value is not immediately provided.

### Accessing properties

Class properties can be accessed using _dot notation_ where the name of the value is followed by a dot (`.`) and the name of the property. If a property of a class has properties of its own, this dot notation can be used to access these nested properties as well.

This notation can be used both to retrieve the property's value and, where allowed, to change it.

```swift
someCharacter.name
// => nil
someCharacter.name = "Luther"
someCharacter.name
// => "Luther"

someCharacter.id  = "new id"
// Error: Cannot assign to property: 'id' is a 'let' constant
```

### Methods

Like properties, which store data in your classes, you may also define _methods_ which store functions in your class.

Methods are defined in the same way as a regular function, only inside the body of the class. Additionally, if a property can be changed by a method, that property must be defined using `var` rather than `let`, just like regular variables.

```swift

class GameCharacter {
  var characterClass: String?
  var name: String?
  var active = false
  let id: String = makeRandomID()

  func takesDamage(_ damage: Double) {
    if damage > 100 {
      active = false
    }
  }
  func sayName() -> String {
    return "My name is \(name ?? "no one"), my class is \(characterClass ?? "undetermined")"
  }
}
```

These methods can be called using dot notation, just like properties.

```swift
var myChar = GameCharacter()
myChar.active = true
myChar.takesDamage(200)
myChar.active
// => false
```

### Self

Instances classes each have an implicit value named `self` which refers to the instance itself. There are multiple uses for `self`, but it is most commonly used to disambiguate the names of properties and methods of the struct/class when there may be some confusion.
