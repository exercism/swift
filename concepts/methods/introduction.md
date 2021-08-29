# Introduction

Like properties, which store data in your structs and classes, you may also define _methods_ which store functions in your struct or class.

Methods are defined in the same way as a regular function, only inside the body of the struct or class. Note that if a function changes the value of a property in a struct, it must be preceded by the `mutating` keyword. Additionally, if a property can be changed by a method, that property must be defined using `var` rather than `let`, just like regular variables.

```swift
struct CharacterStats {
  var health = 0.0
  var speed = 0
  var strength = 0

  mutating func takeHit(_ damage: Double) {
    health = max(0.0, health - damage)
  }
  func canLift(_ weight: Int) -> Bool {
    weight < strength * 100
  }
}
```

These methods can be called using dot notation, just like properties.

```swift
var stats = CharacterStats(health: 72.8, speed: 19, strength: 6)
stats.canLift(500)
// => true
```
