# Introduction

[Dictionaries][dictionaries] are one of Swift's primary collection types.
A dictionary stores unordered associations between unique keys and corresponding values.
All keys in a dictionary must be of the same type, and all values must also share the same type.

Dictionary literals are written as comma-separated `key: value` pairs enclosed in square brackets:

```swift
var addresses: Dictionary<String, String> = [
    "The Munsters": "1313 Mockingbird Lane",
    "The Simpsons": "742 Evergreen Terrace",
    "Buffy Summers": "1630 Revello Drive"
]

var sequences: [String: [Int]] = [
    "Euler's totient": [1, 1, 2, 2, 4, 2, 6, 4],
    "Lazy caterer": [1, 2, 4, 7, 11, 16, 22, 29, 37],
    "Carmichael": [561, 1105, 1729, 2465, 2821, 6601, 8911, 10585, 15841]
]

let constants = [
    "pi": 3.14159,
    "e": 2.71828,
    "phi": 1.618033,
    "avogadro": 6.02214076e23
]
```

Dictionary types can be written explicitly in two ways: `Dictionary<Key, Value>` or the shorthand syntax `[Key: Value]`.

To create an empty dictionary, specify its key and value types explicitly:

```swift
var emptyDict1: [Int: Int] = [:]
var emptyDict2 = [Character: String]()
var emptyDict3 = Dictionary<Int, Double>()
```

## Accessing Values

You can access values using subscript notation: place the key inside square brackets after the dictionary name.
Because a key might not exist in the dictionary, subscript access returns an *optional* (`Value?`).
If the key is present, Swift returns the wrapped value; if not, it returns `nil`:

```swift
let munster: String? = addresses["The Munsters"]
// Returns Optional("1313 Mockingbird Lane")

let carmichael = sequences["Carmichael"]
// Returns Optional([561, 1105, 1729, 2465, 2821, 6601, 8911, 10585, 15841])

let planck = constants["planck"]
// Returns nil
```

To avoid working with optionals, you can provide a default value using the `default` parameter:

```swift
let e: Double = constants["e", default: 0]
// Returns 2.71828

let hoagie: [Int] = sequences["Hoagie", default: []]
// Returns []

let betty = addresses["Betty Cooper", default: "Address unknown"]
// Returns "Address unknown"
```

## Modifying Dictionaries

For mutable dictionaries declared with `var`, you can add or update key-value pairs using subscript assignment:

```swift
sequences["Euler's totient"]?.append(contentsOf: [6, 4])
// sequences["Euler's totient"] is now [1, 1, 2, 2, 4, 2, 6, 4, 6, 4]

addresses["Betty Cooper"] = "111 Queens Ave."
addresses["Betty Cooper", default: "Address unknown"]
// Returns "111 Queens Ave."

constants["Gelfond's"] = 23.140692
// Compiler error: Cannot assign through subscript: 'constants' is a 'let' constant
```

## Iterating Over a Dictionary

You can iterate through each key-value pair of a dictionary using a `for-in` loop.
Each item is provided as a `(key, value)` tuple:

```swift
for (name, address) in addresses {
    print("\(name) lives at \(address)")
}
```

## Sorting Dictionaries

Because dictionaries are unordered, sorting them produces an array of key-value pairs.
You can pass a closure to the `sorted(by:)` method that compares two `(key, value)` tuples and returns `true` if the first tuple should appear before the second:

```swift
func sortByNameLengthThenValue(_ lhs: (key: String, value: Double), _ rhs: (key: String, value: Double)) -> Bool {
    let left = lhs.value + Double(lhs.key.count)
    let right = rhs.value + Double(rhs.key.count)
    return left < right
}

let sortedConstants = constants.sorted(by: sortByNameLengthThenValue)
```

[dictionaries]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes/#Dictionaries
