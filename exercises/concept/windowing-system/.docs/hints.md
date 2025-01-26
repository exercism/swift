# Hints

## General

- [Structs and classes][structs-and-classes] share similar definition syntax.

## 1. Define a Size struct

- Properties must be defined as `var`s if they can be changed.
- Methods in a struct must be marked `mutating` if they change properties of the struct.

## 2. Define a Position struct

- Properties must be defined as `var`s if they can be changed.
- Methods in a struct must be marked `mutating` if they change properties of the struct.

## 3. Define a Window class

- Structs can be initialized with different property values using [memberwise initializers][memberwise-initializers].
- Constant properties should be defined using `let`.
- Properties can be changed using their own methods, where available.

[structs-and-classes]: https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
[memberwise-initializers]: https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html#ID87
[initializing-via-closure]: https://docs.swift.org/swift-book/LanguageGuide/Initialization.html#ID232
