# About

[Tuples][tuples] group multiple values into a single compound value.
Unlike arrays, the values in a tuple do not need to share the same type, and a tuple's size is fixed once created.

Create a tuple by enclosing comma-separated values in parentheses:

```swift
let order = ("biscuits", 2.99, 3)
```

You can also specify type annotations explicitly:

```swift
let order: (String, Double, Int) = ("biscuits", 2.99, 3)
```

To extract individual elements from an unnamed tuple, use zero-based index syntax (`.0`, `.1`, etc.):

```swift
let item = order.0     // "biscuits"
let quantity = order.2 // 3
```

## Named Tuples

You can give names to individual tuple elements when defining the tuple:

```swift
let order = (item: "biscuits", price: 2.99, quantity: 3)
```

Naming elements makes code more readable and allows you to access elements using dot notation with their labels:

```swift
let item = order.item         // "biscuits"
let quantity = order.quantity // 3
```

You can also include element names in the type annotation:

```swift
let order: (item: String, price: Double, quantity: Int) = (item: "biscuits", price: 2.99, quantity: 3)
```

## Modifying Tuples

If a tuple is declared as a variable (`var`), you can update its elements:

```swift
var order = ("biscuits", 2.99, 3)
order.0 = "cookies"
order.1 = 1.99
order.2 = 5

print(order)
// Prints ("cookies", 1.99, 5)
```

## Returning Multiple Values

While Swift functions can only return a single value, returning a tuple lets you package and [return multiple values][multiple-return-values] from a function:

```swift
func divide(_ dividend: Int, by divisor: Int) -> (quotient: Int, remainder: Int) {
    let quotient = dividend / divisor
    let remainder = dividend % divisor
    return (quotient, remainder)
}

let result = divide(14, by: 4)
print("Quotient: \(result.quotient), Remainder: \(result.remainder)")
// Prints "Quotient: 3, Remainder: 2"
```

## Tuple Decomposition

You can decompose (unpack) a tuple's values into separate constants or variables:

```swift
let order = ("biscuits", 2.99, 3)
let (item, price, quantity) = order

print(item) // Prints "biscuits"
```

Tuple decomposition also works directly in `for-in` loops:

```swift
let orders = [("biscuits", 2.99, 3), ("cookies", 1.99, 5)]

for (item, price, quantity) in orders {
    print("Item: \(item), Price: \(price), Quantity: \(quantity)")
}
```

[tuples]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/#Tuples
[multiple-return-values]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/#Functions-with-Multiple-Return-Values
