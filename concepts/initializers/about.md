# About

Initializers are special methods that are used to set up a value of the enum. Their definition looks a lot like that of a method only there is no `func` keyword, no return type, and the name must be `init` and the initializer _must_ assign a value of the enum to `self`. Initializers are called either via dot notation or by passing the initializer's parameters to the name of the enum.

```swift
enum Coin {
  case heads
  case tails

  init(_ i: Int) {
    if i.isMultiple(of: 2) {
      self = .heads
    } else {
      self = .tails
    }
  }

  func flip() -> Self {
    switch self {
    case .heads: return .tails
    case .tails: return .heads
    }
  }
}

let tails = Coin.init(13)
// .tails
let heads = Coin(0)
// .heads
let anotherTails = heads.flip()
// .tails
```
