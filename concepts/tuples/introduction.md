# About

[Tuples][tuples] are used to combine multiple values into a single compound value where each of the values may have a different type.
The compound value has a type that is the combination of the individual values' types.
Like arrays, tuples are ordered collections.
However, contrary to arrays, tuples are fixed in size, thereby to change the number of elements in a tuple, a new tuple must be created.

To create a tuple, you enclose the values in parentheses, separated by commas:

```swift
let order = ("biscuits", 2.99, 3)
```

You can also specify the type of each value in the tuple:

```swift
let order: (String, Double, Int) = ("biscuits", 2.99, 3)
```

To extract the individual values from a tuple, you can use the `.n` syntax, where _n_ is the index of the element you would like to access, starting with 0:

```swift
let orderItem = order.0
// Returns "biscuits"

let orderQuantity = order.2
// Returns 3
```

## Named tuples

Tuples can be named by providing labels for each of the values:

```swift
let order = (item: "biscuits", price: 2.99, quantity: 3)
```

This can be useful for making the tuple more readable and self-explanatory, especially when the tuple is used as a return value from a function.

It also allows you to access the individual values by their names:

```swift
let orderItem = order.item
// Returns "biscuits"
let orderQuantity = order.quantity
// Returns 3
```

Same as non-named tuples, you can specify the type of each value in a named tuple:

```swift
let order: (item: String, price: Double, quantity: Int) = (item: "biscuits", price: 2.99, quantity: 3)
```

## Modifying tuples

Elements of a tuple can be modified, it can be done using the `.n` syntax.

```swift
var order = ("biscuits", 2.99, 3)
order.0 = "cookies"
order.1 = 1.99
order.2 = 5

order
// Returns ("cookies", 1.99, 5)
```

## Multiple return values

Functions in Swift can only return a single value.
However, since a tuple is a single value, you can package multiple values into a tuple and return that tuple from a function.
This allows you to effectively [return multiple values from a function][multiple-return-values].

Here is an example of a function that returns a tuple with a quotient and a remainder:

```swift
func divide(_ dividend: Int, by divisor: Int) -> (quotient: Int, remainder: Int) {
  let quotient = dividend / divisor
  let remainder = dividend % divisor
  return (quotient, remainder)
}
```

## Tuple decomposition

You can decompose a tuple into its individual components by providing a number of variables equal to the number of elements in the tuple.
Using tuple decomposition can increase the readability of your code, since it allows you to assign meaningful names to the individual values.

```swift
let order = ("biscuits", 2.99, 3)
let (item, price, quantity) = order

item
// Returns "biscuits"
```

Decomposition can also be done with for-in loops:

```swift
let orders = [("biscuits", 2.99, 3), ("cookies", 1.99, 5)]

for (item, price, quantity) in orders {
  print("Item: \(item), Price: \(price), Quantity: \(quantity)")
}
```

[tuples]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Tuples
[multiple-return-values]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/#Functions-with-Multiple-Return-Values
