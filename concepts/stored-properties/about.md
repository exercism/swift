# About

A struct or class can define **stored properties** to store data as part of an instance.
Stored properties can be declared as variables (using `var`) if their values can change, or as constants (using `let`) if their values remain fixed once initialized:

```swift
class GameCharacter {
    var health = 10
    let id = makeRandomID()
}

let character1 = GameCharacter()
let character2 = GameCharacter()

print(character1.health) // Prints 10
print(character2.health) // Prints 10

character1.health = 25

print(character1.health) // Prints 25
print(character2.health) // Prints 10

// The following line triggers a compiler error because 'id' is a constant:
// character2.id = 2
```
