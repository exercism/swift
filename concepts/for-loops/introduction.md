# Introduction

For-in loops are used to iterate over a sequence of values, taking each element in turn, binding it to a variable or constant name of the developer's choosing, then executes a block of code that may refer to the element. When every element of the sequence has been iterated over, the loop exits and execution begins with the first line following the body of the loop.

```swift
let numbers = [3, 10, 7, 11]

for number in numbers {
  print("\(number) / 2 = \(number / 2)")
}
print("Done with numbers")

// prints:
// 3 / 2 = 1
// 10 / 2 = 5
// 7 / 2 = 3
// 11 / 2 = 5
// Done with numbers
```
