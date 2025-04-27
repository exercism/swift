# About

[Arrays][array] are one of Swift's three primary collection types.
Arrays are ordered lists of elements where the elements can be of any type, however, all elements of any given list must have the same type.
Arrays are mutable when assigned to a variable, meaning that the elements of an array can be modified after the array is created.
This is not the case when an array is assigned to a constant, in which case the array is immutable.

Array literals are written as a series of elements, each separated by a comma, enclosed in square brackets.
Swift will infer the type of the array from the type of the elements in the array literal.

```swift
let evenInts = [2, 4, 6, 8, 10, 12]
var oddInts = [1, 3, 5, 7, 9, 11, 13]
let greetings = ["Hello!", "Hi!", "¡Hola!"]
```

Arrays can also be explicitly typed by specifying the type of the elements in the array.
Type names for arrays are written in one of two ways: `Array<T>` or `[T]` where `T` is the type of the elements in the array.

```swift
let evenInts: Array<Int> = [2, 4, 6, 8, 10, 12]
var oddInts: [Int] = [1, 3, 5, 7, 9, 11, 13]
let greetings: [String] = ["Hello!", "Hi!", "¡Hola!"]
```

## Size of an Array

The number of elements in an array can be determined using the [`count`][count] property.

```swift
evenInts.count
// returns 6
```

## Empty Arrays

When wanting an empty array, the type must be specified.
This can be done by using either the array initializer syntax or by using the type annotation syntax.

```swift
let emptyArray = [Int]()
let emptyArray2 = Array<Int>()
let emptyArray3: [Int] = []
```

## Multi-dimensional Arrays

Arrays can be nested to create multi-dimensional arrays.
When explicitly typing a multi-dimensional array, the type of the elements of the innermost array must be specified, using: `Array<Array<T>>` or `[[T]]`.

```swift
let multiDimArray = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let multiDimArray2: [[Int]] = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
```

## Append to an Array

Elements can be appended to the end of an array using the [`append(_:)`][append] method.
The `append(_:)` method takes a single argument, the element to be appended to the array.

```swift
var oddInts = [1, 3, 5, 7, 9, 11, 13]
oddInts.append(15)
// oddInts is now [1, 3, 5, 7, 9, 11, 13, 15]
```

## Insert into an Array

Elements can be inserted into an array using the [`insert(_:at:)`][insert] method.
The `insert(_:at:)` method takes two arguments, the element to be inserted into the array and the index at which the element should be inserted.

```swift
var oddInts = [1, 3, 5, 7, 9, 11, 13]
oddInts.insert(0, at: 0)
// oddInts is now [0, 1, 3, 5, 7, 9, 11, 13]
```

## Add an Array to an Array

An array can be added to the end of another array using the `+` operator.
It is important to note that the `+` operator creates a new array and does not modify the original array, which is different from the `append(_:)` or `insert(_:at:)` methods.

```swift
var oddInts = [1, 3, 5, 7, 9, 11, 13]
oddInts + [15, 17, 19]
// returns [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]

print(oddInts)
// prints [1, 3, 5, 7, 9, 11, 13]
```

## Accessing Elements of an Array

Elements of an array can be accessed individually by supplying the index of the element inside square brackets following the array.
The index of an element is an `Int` and starts with `0` for the first (leftmost) element.
If the index is outside the valid range of indices, a runtime error will occur and the program will crash.

```swift
let evenInts = [2, 4, 6, 8, 10, 12]
let oddInts = [1, 3, 5, 7, 9, 11, 13]

evenInts[2]
// returns 6

oddInts[7]
// Fatal error: Index out of range
```

## Modifying Elements of an Array

Elements of an array can be modified by assigning a new value to the element at a given index.
The index of an element is an `Int` and starts with `0` for the first (leftmost) element.
If the given index is outside the valid range of indices for the array, a runtime error will occur and the program will crash.

```swift
var evenInts = [2, 4, 6, 8, 10, 12]

evenInts[2] = 0
// evenInts is now [2, 4, 0, 8, 10, 12]
```

## Converting an Array to a String and Back

An array of `n` strings can be converted to a single string using the [`joined(separator:)`][joined] method.
The `joined(separator:)` method takes a single argument, the separator to be used between elements of the array.
The separator must be a string.

```swift
let evenInts = ["2", "4", "6", "8", "10", "12"]
let evenIntsString = evenInts.joined(separator: ", ")
// returns "2, 4, 6, 8, 10, 12"
```

An array can be converted from a string using the [`split(separator:)`][split] method.
The `split(separator:)` method takes a single argument, the separator to be used between elements of the array.

```swift
let evenIntsString = "2, 4, 6, 8, 10, 12"
let evenInts = evenIntsString.split(separator: ", ")
// returns ["2", "4", "6", "8", "10", "12"]
```

## Delete an Element from an Array

Elements can be deleted from an array using the [`remove(at:)`][remove] method.
The `remove(at:)` method takes a single argument, the index of the element to be removed from the array.
The index of an element is an `Int` and starts with `0` for the first (leftmost) element.
If the given index is outside the valid range of indices for the array, a runtime error will occur and the program will crash.

```swift
var oddInts = [1, 3, 5, 7, 9, 11, 13]
oddInts.remove(at: 3)
// oddInts is now [1, 3, 5, 9, 11, 13]
```

If the last element of an array is to be removed, the [`removeLast()`][removeLast] method can be used.
The `removeLast()` method takes no arguments.
If the array is empty, a runtime error will occur and the program will crash.

```swift
var oddInts = [1, 3, 5, 7, 9, 11, 13]
oddInts.removeLast()
// oddInts is now [1, 3, 5, 7, 9, 11]
```

[array]: https://developer.apple.com/documentation/swift/array
[count]: https://developer.apple.com/documentation/swift/array/count
[insert]: https://developer.apple.com/documentation/swift/array/insert(_:at:)-3erb3
[remove]: https://developer.apple.com/documentation/swift/array/remove(at:)-1p2pj
[removeLast]: https://developer.apple.com/documentation/swift/array/removelast()
[append]: https://developer.apple.com/documentation/swift/array/append(_:)-1ytnt
[joined]: https://developer.apple.com/documentation/swift/array/joined(separator:)-5do1g
[split]: https://developer.apple.com/documentation/swift/string/2894564-split
