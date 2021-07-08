# Introduction

Strings in Swift are a collection of characters, where characters are, more or less, a single printable element. So strings in Swift are able to contain Unicode characters and emoji.

Strings are easily created in Swift through string literals. String literals are similar to those seen in many other programming languages, characters enclosed between a pair of double quotation marks (`"`). Certain characters use a special notation inside of strings so they can be properly represented, such as the newline character which is written as `\n` inside strings or the double-quote character which is written as `\"` inside of a string so the compiler knows it isn't the double-quote which ends the string.

An empty string is represented by two double quotation marks with nothing between them.

```swift
let hello = "Hello, World!"
let sausage = "Weißwurst is a tasty sausage."
var fam = "This is my family: 👨‍👩‍👦‍👦, this is our dog: 🐶"
var empty = ""
```
