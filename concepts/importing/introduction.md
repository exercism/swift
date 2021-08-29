# Introduction

Importing modules is done by writing the `import` keyword followed by the name of the module. This allows access to all of the types, values, and functionality inside that module; in this example we are making use of the `components(separatedBy:)` method which becomes available to `String` with this import.

```swift
import Foundation

let csv = "apple,pear,peach,orange,cherry,lime,goosberry"
let fruit = csv.components(separatedBy: ",")
// => ["apple", "pear", "peach", "orange", "cherry", "lime", "goosberry"]
```
