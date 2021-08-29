# Introduction

Accessing individual characters in strings is both like and unlike accessing individual elements of an array. The first and last elements are easily accessed using the `first` and `last` properties of the string respectively. Note that, as a string may not have a first or last character, these properties return optional Characters which will need to be unwrapped if they are to be used.

Other individual characters can be accessed using the subscripting method used with arrays. However, the indices used for strings are _not_ integers and can not be worked with directly. Instead they must be computed based off of some other known index, such as `startIndex`, which points to the position of the first character in a nonempty string.

For example, you cannot write `csv[21]` to get the "g" in "orange", you must instead compute a value of type `String.Index`.

```swift
let index = csv.index(csv.startIndex, offsetBy: 21)
csv[index]
// => "g"
```
