# About

[Structs and classes][structs-and-classes] are the primary building blocks for creating custom types in Swift.
Both allow you to group related properties (data) and methods (behavior) into reusable units.
Most core types in Swift, including `Int`, `Double`, `String`, and collection types like `Array` and `Dictionary`, are implemented as structs.

For detailed guides on each type, see:

- [concept:swift/structs]()
- [concept:swift/classes]()

## Choosing Between Structs and Classes

While both structs and classes let you define custom types, they differ fundamentally in how they are passed around in memory:

- **Structs are value types**: When you assign or pass a struct, Swift makes an independent copy of its data.
Changes made to one copy do not affect other copies.
- **Classes are reference types**: When you assign or pass a class instance, Swift shares a reference to the existing instance.
Changes made through one reference immediately affect all other references pointing to the same instance.

Swift emphasizes safety and predictable behavior, which makes structs the default recommendation for most custom types.
Using value types ensures that mutating data in one part of your program does not produce unexpected side effects elsewhere.

In general:

- **Use a struct** when modeling data that represents independent values (such as coordinates, shapes, geometric dimensions, or formatted records).
- **Use a class** when modeling entities that have distinct identities or shared lifecycle requirements (such as UI controls, database connections, or file handles).

[structs-and-classes]: https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
