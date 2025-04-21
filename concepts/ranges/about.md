# Ranges

[Ranges][range] represent an interval between two values.
The most common types that support ranges are `Int`, `String`, and `Date`.
They can be used for many things, such as quickly creating a collection, slicing an array, checking if a value is in a range, and iteration.
They are created using the range operator `...` or `..<` (inclusive and exclusive, respectively).

```swift
1...5 // A range containing 1, 2, 3, 4, 5
1..<5 // A range containing 1, 2, 3, 4
```

The reason for having two range operators is to create ranges that are inclusive or exclusive of the end value, which can be useful when, for example, working with zero-based indexes.

~~~~exercism/note
When creating a range in Swift using the range operators `...` or `..<`, and wanting to call a method on the range, you need to wrap the range in parentheses.
This is because the otherwise will the method be called on the 2nd argument of the range operator.

```swift
(1...5).contains(3) // Returns true
1...5.contains(3) // => Error: value of type 'Int' has no member 'contains'
```
~~~~

## Convert a range to an array

To convert a range to an array, you can use the `Array` initializer.
This can be useful when you want to create a collection of values, without having to write them out.

```swift
let range = 1...5
let array = Array(range) // Returns [1, 2, 3, 4, 5]
```

## Slice an array

Ranges can be used to slice an array.

```swift
let array = [1, 2, 3, 4, 5]
// Returns [1, 2, 3, 4, 5]
let slice = array[1...3]
// Returns [2, 3, 4]
```

## Range methods

Ranges do have a set of methods that can be used to work with them.
For example, these methods can be used to get the sum of all the values in the range or check if the range includes a value.

| Method                  | Description                                                             | Example                               |
| ----------------------- | ----------------------------------------------------------------------- | ------------------------------------- |
| `count`       | Returns the size of the range                                           | `(1...5).count // returns 5`          |
| [`contains`][contains]  | Returns `true` if the range includes the given value, otherwise `false` | `(1...5).contains(3) // Returns true` |

## Endless & Beginningless ranges

A range can be endless and beginless.

Using beginless and endless ranges is useful when you want to, for example, slice an array from the beginning or to the end.

~~~~exercism/caution
If not used on a collection, the endless range can cause an endless sequence, if not used with caution.
~~~~

## String ranges

String can be used in ranges and allow you to get an interval of Strings between two Strings.
For example, this can be handy when you want to get the alphabet.

```swift
"a"..."z" // A range containing ["a", "b", "c", ..., "z"]
```

[range]: https://developer.apple.com/documentation/swift/range
[contains]: https://developer.apple.com/documentation/swift/range/contains(_:)
