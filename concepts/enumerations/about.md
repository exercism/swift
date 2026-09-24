# About

When modeling data that can only take on a specific set of possible states—such as days of the week, compass directions, or buttons on a controller—basic types like `Int` or `String` have major drawbacks.
With integers or strings, your code must constantly check for invalid values (like a status code of `999` or a typo like `"leftt"`), and human readers cannot easily tell what numbers represent.

Swift solves this problem with [_Enumerations_][enumerations] (often shortened to *enums*).
An enum defines a common type for a group of related, named values. Because the compiler knows all possible cases ahead of time, it can check your code for accuracy and completeness at compile time.
Enums can also have methods, initializers, and computed properties.

## Defining Enums

Define an enum using the `enum` keyword followed by the type name, with its cases listed inside curly braces.
By Swift convention, the type name uses `UpperCamelCase`, while each case uses `lowerCamelCase`:

```swift
enum NESButton {
    case up
    case down
    case left
    case right
    case a
    case b
    case select
    case start
}
```

You can also define multiple cases on a single line separated by commas:

```swift
enum NESButton {
    case up, down, left, right, a, b, select, start
}
```

To refer to an enum case, write the enum type name, a dot (`.`), and the case name. Once the type is known or can be inferred by the compiler, you can omit the type name and use the shorter dot syntax:

```swift
var lastPressed = NESButton.up

// Swift infers the type, so you can omit the type name:
lastPressed = .down

let konamiCode: [NESButton] = [.up, .up, .down, .down, .left, .right, .left, .right, .b, .a]
```

## Enums and Switch Statements

Enums work seamlessly with [`switch` statements][enums-and-switches].
Because a `switch` in Swift must be exhaustive, the compiler ensures you handle every possible case:

```swift
lastPressed = .left
switch lastPressed {
case .up: print("You pressed the UP button")
case .down: print("You pressed the DOWN button")
case .left: print("You pressed the LEFT button")
case .right: print("You pressed the RIGHT button")
case .a: print("You pressed the A button")
case .b: print("You pressed the B button")
case .select: print("You pressed the SELECT button")
case .start: print("You pressed the START button")
}
// Prints "You pressed the LEFT button"
```

If you miss any case without providing a `default` clause, the compiler reports an error:

```swift
switch lastPressed {
case .up, .down, .left, .right:
    print("You pressed a direction button.")
}
// Error: Switch must be exhaustive
```

Listing all cases explicitly is often preferable to using `default`. That way, if you add a new case in the future, the compiler will immediately alert you to update every `switch` statement that handles that enum.

## Methods and Initializers

Enums can define methods and custom initializers just like classes and structs. Inside an enum method, `self` refers to the current case value:

```swift
enum Coin {
    case heads
    case tails

    init(_ value: Int) {
        if value.isMultiple(of: 2) {
            self = .heads
        } else {
            self = .tails
        }
    }

    func flip() -> Coin {
        switch self {
        case .heads: return .tails
        case .tails: return .heads
        }
    }
}

let tails = Coin(13)     // .tails
let heads = Coin(0)      // .heads
let flipped = heads.flip() // .tails
```

## Raw Values

Enum cases can be prepopulated with default values called [_raw values_][raw-values].
All raw values in an enum must share the same type (such as `Int`, `String`, or `Character`):

```swift
enum NESButton: Character {
    case up = "⬆️"
    case down = "⬇️"
    case left = "⬅️"
    case right = "➡️"
    case a = "🅰️"
    case b = "🅱️"
    case select = "✅"
    case start = "🚦"
}

print(NESButton.left.rawValue) // Prints "⬅️"
```

You can initialize an enum from a raw value using `init(rawValue:)`. Because an invalid raw value might be provided, this initializer returns an optional:

```swift
let upButton = NESButton(rawValue: "⬆️") // Optional(NESButton.up)
let invalid = NESButton(rawValue: "🙄")  // nil
```

Swift can automatically assign raw values for `String` and `Int` enums:

- For `String` enums, each case's raw value defaults to its case name.
- For `Int` enums, raw values start at `0` and increment by 1 unless specified otherwise.

```swift
enum Planet: Int {
    case mercury = 1, venus, earth, mars
}

print(Planet.earth.rawValue) // Prints 3
```

## Associated Values

Enum cases can also store custom values of varying types alongside each case, known as [_associated values_][associated-values]:

```swift
enum Suit: Character {
    case diamonds = "♦️", clubs = "♣️", hearts = "♥️", spades = "♠️"
}

enum Card {
    case ace(Suit)
    case king(Suit)
    case queen(Suit)
    case jack(Suit)
    case number(Suit, Int)

    func description() -> String {
        switch self {
        case .ace(let suit): return "A\(suit.rawValue)"
        case .king(let suit): return "K\(suit.rawValue)"
        case .queen(let suit): return "Q\(suit.rawValue)"
        case .jack(let suit): return "J\(suit.rawValue)"
        case let .number(suit, value): return "\(value)\(suit.rawValue)"
        }
    }
}

let aceOfSpades = Card.ace(.spades)
let twoOfHearts = Card.number(.hearts, 2)

print(aceOfSpades.description()) // Prints "A♠️"
print(twoOfHearts.description()) // Prints "2♥️"
```

An enum can use raw values or associated values, but not both.

## Recursive Enumerations

A [recursive enumeration][recursive-enumerations] is an enum that has another instance of the enum as the associated value for one or more cases.
To enable recursion, mark the case (or the entire enum) with the `indirect` keyword:

```swift
enum BinaryTree {
    case leaf(value: Int)
    indirect case node(left: BinaryTree, value: Int, right: BinaryTree)
}

let tree: BinaryTree = .node(
    left: .leaf(value: 1),
    value: 3,
    right: .node(left: .leaf(value: 5), value: 6, right: .leaf(value: 9))
)
```

[enumerations]: https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html
[enums-and-switches]: https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html#ID147
[recursive-enumerations]: https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html#ID536
[raw-values]: https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html#ID149
[associated-values]: https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html#ID148
