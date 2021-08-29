# About

A struct or class can define _stored properties_, which are defined and behave just like regular constants or variables and are stored as part of an instance of that struct/class.

```swift
class GameCharacter {
  var health = 10
  let id = makeRandomID()
}

let character1 = GameCharacter()
let character2 = GameCharacter()

character1.health // => 10
character2.health // => 10

character1.health = 25

character1.health // => 25
character2.health // => 10

// This would trigger a compiler error due to id being a constant
// character2.id = 2
```
