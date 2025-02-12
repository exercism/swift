# Hints

## General

- The individual components of a tuple can be accessed by appending a _.n_ to the name of the tuple, where _n_ is the index of the component, starting with 0.

## 1. Get name of the toy

- You can access the name of the toy by using the `.n` syntax.

## 2. Add a new toy to the database

- You can create a new tuple by using the syntax tuple `(name1: value1, name2: value2, ...)`.

## 3. Update quantity of a toy

- You can use a [for-loop][for-loop] to iterate over the array of tuples and update the quantity of the toy.
- You can use earlier implemented functions to get the name of the toy.
- You can use a [conditional statement][conditional-statement] to check if the name of the toy matches the one you want to update.
- You can use the `.n` syntax to update the quantity of the toy, e.g: `toys.price = 3`.

## 4. Add category key to a toy

- You can use a [for-loop][for-loop] to iterate over the array of tuples and add the category key to the toy.
- A tuple is immutable, so you need to create a new tuple with the category key added.
  
[for-loop]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#For-In-Loops
[conditional-statement]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Conditional-Statements
