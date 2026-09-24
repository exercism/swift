# About

Classes are a fundamental building block of Swift programs.
They allow you to group related properties (data) and methods (functions) into self-contained units of functionality.

### Defining Classes

To define a class, use the `class` keyword followed by the class name, with the class definition enclosed in curly braces:

```swift
class GameCharacter {
    var characterClass: String?
    var name: String?
    var active = false
    let id = makeRandomID()
}
```

The body of a class can contain stored properties, which are defined and behave like regular constants (`let`) or variables (`var`).

### Instances

A class definition serves as a blueprint: it defines a new type and describes what its values look like, but it does not create any instances on its own.

To create an *instance* of a class, call its initializer by writing the class name followed by parentheses:

```swift
let someCharacter = GameCharacter()
```

This creates a new instance whose properties are initialized with the default values specified in the class definition.
For optional properties without explicit default values (such as `name`), Swift defaults them to `nil`.

### Accessing Properties

You access an instance's properties using *dot notation*: write the instance name, a dot (`.`), and the property name.
Dot notation also works for nested properties.

You can use dot notation to read values and, if the property is mutable (`var`), assign new values:

```swift
someCharacter.name
// => nil

someCharacter.name = "Luther"
someCharacter.name
// => "Luther"

someCharacter.id = "new id"
// Error: Cannot assign to property: 'id' is a 'let' constant
```

### Methods

In addition to properties, classes can define *methods*—functions associated with the class.

Define methods inside the class body using the standard `func` syntax.
If a method modifies a property, that property must be declared with `var`:

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

Call methods on an instance using dot notation, just like properties:

```swift
var myChar = GameCharacter()
myChar.active = true
myChar.takesDamage(200)
myChar.active
// => false
```

### Self

Every instance of a class has an implicit property named `self`, which refers to the instance itself.
While often omitted when referring to properties or methods, `self` is commonly used to distinguish between property names and method parameter names when they share the same name.
