# Introduction

When a function accepts another function (or closure) as a parameter, that passed-in closure is called *non-escaping* by default.
A closure is said to *escape* a function when it is called after the function itself has already returned.

This situation commonly occurs when:

- A closure is stored in an external variable or property.
- A closure is executed asynchronously after an operation completes.
- A closure is returned from the function to be called later.

Consider the following example:

```swift
func emptyKitchen(_ order: String) -> String {
    "Sorry, we're all out of \(order)."
}

func prepare(order: String, kitchen: (String) -> String) -> (String) -> String {
    func newKitchen(_ newOrder: String) -> String {
        if newOrder == order {
            return "One \(order) coming up!"
        } else {
            return kitchen(newOrder)
        }
    }
    return newKitchen
}
```

In this code, `prepare` accepts a function named `kitchen`, constructs a new function `newKitchen` that calls `kitchen`, and returns `newKitchen`.
Attempting to compile this code produces an error: `Escaping local function captures non-escaping parameter 'kitchen'`.

Because `newKitchen` outlives `prepare`, the `kitchen` closure escapes.
To allow this, mark the parameter's type with the `@escaping` attribute.

```swift
func prepare(order: String, kitchen: @escaping (String) -> String) -> (String) -> String {
    func newKitchen(_ newOrder: String) -> String {
        if newOrder == order {
            return "One \(order) coming up!"
        } else {
            return kitchen(newOrder)
        }
    }
    return newKitchen
}

let restaurant = prepare(
    order: "sandwich",
    kitchen: prepare(
        order: "chicken",
        kitchen: prepare(order: "steak", kitchen: emptyKitchen)
    )
)

print(restaurant("pork chop"))
// Prints "Sorry, we're all out of pork chop."

print(restaurant("chicken"))
// Prints "One chicken coming up!"
```

The `@escaping` attribute informs the Swift compiler that the closure will outlive the immediate function call, allowing Swift to properly manage memory and captured references.

[escaping]: https://docs.swift.org/swift-book/LanguageGuide/Closures.html#ID546
