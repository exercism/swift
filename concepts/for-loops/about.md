# For loops

Looping is a fundamental concept in programming that allows you to execute a block of code multiple times.
In Swift, there are two types of loops: [`for-in` loops][for-loops] and `while` loops. 
In this chapter, you'll learn about `for-in` loops.

For loops allows you to iterate over a sequence of values, taking each element in turn, binding it to a variable of your choosing.
Swift allows you to iterate over a variety of sequences, such as ranges, arrays, and strings (and more types which will be covered later).
When every element of the sequence has been iterated over, the loop exits.

For loops are declared by using the `for` keyword, followed by a variable name, the `in` keyword, and a sequence of values to iterate over.
The variable given in the `for-in` loop is inmutable, meaning you can't change its value inside the loop.
Here's an example of a `for-in` loop that iterates over an array of numbers:

```swift
let numbers = [3, 10, 7, 11]

for number in numbers {
  print(number)
}
print("Done with numbers")

// prints:
// 3
// 10
// 7
// 11
// Done with numbers
```

~~~~exercism/note
The `number` variable is declared in the `for-in` loop and is only available within the loop's scope.

```swift
let numbers = [3, 10, 7, 11]

for number in numbers {
    number + 1
}
number + 1
// Error: Use of unresolved identifier 'number'
```
~~~~

## Iterating over a range

You can also iterate over a range of numbers using a `for-in` loop.
This allows you to execute a block of code a specific number of times, for example, the range `1...5` will iterate over the numbers 1, 2, 3, 4, and 5, so the loop will execute 5 times.
Sometimes you might want to iterate over indexes, in a datastructure like an array, then you can use a `0..<array.count` range.

```swift
let numbers = [3, 10, 7, 11]

for i in 0..<numbers.count {
  print(numbers[i])
}

// prints:
// 3
// 10
// 7
// 11
```

## Iterating over a string

You can also iterate over a string using a `for-in` loop.
This allows you to iterate over each character in the string, and note specifically that the type given in the loop is a `Character`.

```swift
let message = "Hello!"

for character in message {
  print(character)
}

// prints:
// H
// e
// l
// l
// o
// !
```

## Unusued variables

If you don't need the value of the variable in the loop, you can use an underscore `_` to ignore it.

```swift
let numbers = [3, 10, 7, 11]

for _ in numbers {
  print("Hello!")
}
```

## stride

Swift also provides a `stride` function that allows you to create a sequence over a range with a specific step.
Which can be then iterated over using a `for-in` loop.
`stride` is defined as [`stride(from:to:by:)`][stride-to] or [`stride(from:through:by:)`][stride-through], the first one is exclusive and the second one is inclusive.

```swift
for i in stride(from: 0, to: 10, by: 2) {
  print(i)
}

// prints:
// 0
// 2
// 4
// 6
// 8
```

Note that the `to` parameter is exclusive, so the loop will iterate until the number before the `to` parameter, while the `through` parameter is inclusive, so in this case it would also include the `10`.

[stride-to]: https://developer.apple.com/documentation/swift/stride(from:to:by:)
[stride-through]: https://developer.apple.com/documentation/swift/stride(from:through:by:)
[for-loops]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#For-In-Loops
