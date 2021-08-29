# Introduction

Instead of directly indexing into string, one must instead compute a value of type `String.Index` and supply that index instead. Note that these indices are not meant to be human-consumable on their own. They are what is referred to as _opaque indices_ ,as humans need not know what is inside them.

```swift
let csv = "apple,pear,peach,orange,cherry,lime,goosberry"
let index = csv.index(csv.startIndex, offsetBy: 21)
csv[index]
// => "g"
print(index)
// => Index(_rawBits: 1376513)
```
