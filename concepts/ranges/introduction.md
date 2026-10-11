# Introduction

[Ranges][range] represent an interval between two values.
Ranges are commonly used with types like `Int`, `String`, and `Character` to iterate over sequences, slice collections, or check if a value falls within bounds.

Swift provides two primary range operators:

- **Closed range operator (`...`)**: Includes both the start and end values (`1...5` includes 1, 2, 3, 4, and 5).
- **Half-open range operator (`..<`)**: Includes the start value but excludes the end value (`1..<5` includes 1, 2, 3, and 4).

```swift
let closed = 1...5
let halfOpen = 1..<5
```

~~~~exercism/note
When calling a method directly on a range literal, wrap the range expression in parentheses so the compiler evaluates the range first:

```swift
(1...5).contains(3) // Returns true
// 1...5.contains(3) // Error: value of type 'Int' has no member 'contains'
```
~~~~

## Converting a Range to an Array

You can convert a range of numbers into an `Array` using the `Array(_:)` initializer:

```swift
let range = 1...5
let numbers = Array(range)
// numbers is [1, 2, 3, 4, 5]
```

## Slicing an Array with Ranges

You can use ranges to slice sub-sections of an array:

```swift
let array = [10, 20, 30, 40, 50]
let slice = array[1...3]
// slice contains [20, 30, 40]
```

## Range Properties and Methods

Common operations on ranges include:

| Member                  | Description                                                | Example                              |
| ----------------------- | ---------------------------------------------------------- | ------------------------------------ |
| `count`                 | Returns the number of elements in the range                | `(1...5).count` returns `5`          |
| [`contains(_:)`][contains] | Returns `true` if the range includes the specified value | `(1...5).contains(3)` returns `true` |

## One-Sided Ranges

Swift also supports one-sided (partial) ranges, where you omit either the start or end value:

- `array[2...]`: From index 2 to the end of the collection.
- `array[...2]`: From the start of the collection up to and including index 2.
- `array[..<2]`: From the start of the collection up to (but not including) index 2.

## String and Character Ranges

Ranges can also be created between characters or strings that conform to `Comparable`:

```swift
let letters = "a"..."z"
print(letters.contains("m")) // Prints true
print(letters.contains("A")) // Prints false
```

[range]: https://developer.apple.com/documentation/swift/range
[contains]: https://developer.apple.com/documentation/swift/range/contains(_:)
