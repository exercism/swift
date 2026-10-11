# Introduction

In Swift, you cannot index into a string using an integer (such as `string[3]`).
Because Swift strings are composed of variable-length Unicode characters, finding a character requires walking through the preceding characters.

To access a character at a specific position, you must compute an index of type `String.Index`.
These indices are called *opaque indices* because their internal structure is managed by Swift rather than directly manipulated as raw integers:

```swift
let csv = "apple,pear,peach,orange,cherry,lime,gooseberry"
let index = csv.index(csv.startIndex, offsetBy: 21)
print(csv[index])
// Prints "g"

print(index)
// Prints internal representation: Index(_rawBits: ...)
```
