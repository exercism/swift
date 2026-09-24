# Introduction

[Arrays][array] are one of Swift's three primary collection types.
An array is an ordered list of elements.
Arrays can store elements of any type, but all elements in a given array must share the same type.
Arrays are mutable when assigned to a variable, meaning you can add, remove, or modify elements after creating the array.
When assigned to a constant, an array is immutable, meaning its contents cannot be changed.

Array literals are written as a comma-separated list of elements enclosed in square brackets (`[...]`).
Swift can infer the array's type from the elements inside the literal.

```swift
let evenInts = [2, 4, 6, 8, 10, 12]
var oddInts = [1, 3, 5, 7, 9, 11, 13]
let greetings = ["Hello!", "Hi!", "¡Hola!"]
```

You can also specify the type explicitly.
Array types can be written in two ways: `Array<T>` or the shorthand syntax `[T]`, where `T` is the type of values the array contains.

```swift
let evenInts: Array<Int> = [2, 4, 6, 8, 10, 12]
var oddInts: [Int] = [1, 3, 5, 7, 9, 11, 13]
let greetings: [String] = ["Hello!", "Hi!", "¡Hola!"]
```

## Size of an Array

You can find the number of elements in an array using its [`count`][count] property:

```swift
evenInts.count
// returns 6
```

## Empty Arrays

To create an empty array, you must specify its type.
You can do this using array initializer syntax or an explicit type annotation:

```swift
let emptyArray = [Int]()
let emptyArray2 = Array<Int>()
let emptyArray3: [Int] = []
```

## Multi-dimensional Arrays

Arrays can be nested to create multi-dimensional arrays.
When specifying the type of a nested array explicitly, wrap the element type in nested brackets, such as `[[Int]]` or `Array<Array<Int>>`:

```swift
let multiDimArray = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let multiDimArray2: [[Int]] = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
```

## Appending to an Array

You can add an element to the end of a mutable array using the [`append(_:)`][append] method:

```swift
var oddInts = [1, 3, 5, 7, 9, 11, 13]
oddInts.append(15)
// oddInts is now [1, 3, 5, 7, 9, 11, 13, 15]
```

## Inserting into an Array

You can insert an element at a specific index using the [`insert(_:at:)`][insert] method.
This method takes two arguments: the element to insert and the index at which to insert it.

```swift
var oddInts = [1, 3, 5, 7, 9, 11, 13]
oddInts.insert(0, at: 0)
// oddInts is now [0, 1, 3, 5, 7, 9, 11, 13]
```

## Adding Arrays Together

You can combine two arrays into a single array using the `+` operator.
The `+` operator creates and returns a new array; it does not modify the original arrays.

```swift
var oddInts = [1, 3, 5, 7, 9, 11, 13]
let combined = oddInts + [15, 17, 19]
// combined is [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]

print(oddInts)
// prints [1, 3, 5, 7, 9, 11, 13]
```

## Accessing Elements of an Array

You can access an individual element of an array by placing its index inside square brackets (`[]`) following the array name.
Array indices are zero-based `Int` values, starting at `0` for the first element.
Accessing an index outside the valid range causes a runtime error and crashes the program.

```swift
let evenInts = [2, 4, 6, 8, 10, 12]
let oddInts = [1, 3, 5, 7, 9, 11, 13]

evenInts[2]
// returns 6

oddInts[7]
// Fatal error: Index out of range
```

## Modifying Elements of an Array

You can change an element in a mutable array by assigning a new value to a specific index.
As with reading elements, using an index outside the valid range causes a runtime error.

```swift
var evenInts = [2, 4, 6, 8, 10, 12]

evenInts[2] = 0
// evenInts is now [2, 4, 0, 8, 10, 12]
```

## Converting an Array to a String and Back

You can join an array of strings into a single string using the [`joined(separator:)`][joined] method, which takes a separator string:

```swift
let evenInts = ["2", "4", "6", "8", "10", "12"]
let evenIntsString = evenInts.joined(separator: ", ")
// returns "2, 4, 6, 8, 10, 12"
```

You can split a string into an array of substrings using the [`split(separator:)`][split] method, passing the delimiter character:

```swift
let evenIntsString = "2, 4, 6, 8, 10, 12"
let evenInts = evenIntsString.split(separator: ",")
// returns ["2", " 4", " 6", " 8", " 10", " 12"]
```

## Removing Elements from an Array

You can remove an element at a given index using the [`remove(at:)`][remove] method.
The index must be within the array's valid bounds; otherwise, a runtime error occurs.

```swift
var oddInts = [1, 3, 5, 7, 9, 11, 13]
oddInts.remove(at: 3)
// oddInts is now [1, 3, 5, 9, 11, 13]
```

To remove the final element of an array, use the [`removeLast()`][removeLast] method.
Calling `removeLast()` on an empty array causes a runtime error.

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
