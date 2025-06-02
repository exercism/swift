# Hints

## General

- [Structs and classes][structs-and-classes] share similar definition syntax.

## 1. Define a Size struct

- Properties must be defined as `var`s if they can be changed.
- The height and width properties should be given the default values of 80 and 60, respectively.
- Methods in a struct must be marked `mutating` if they change properties of the struct.

## 2. Define a Position struct

- Properties must be defined as `var`s if they can be changed.
- The x and y properties should be given the default values of 0.
- Methods in a struct must be marked `mutating` if they change properties of the struct.

## 3. Define a Window class

- Structs can be initialized with different property values using [memberwise initializers][memberwise-initializers].
- Constant properties should be defined using `let`.
- The `contents` property should be optional, as it may not have a value.
- You have to define an empty initializer for the class (`init() {}`).

## 4. Add a method to resize windows

- The method should take a `to` parameter of type `Size`.
- It is possible to extract the width and height from the `to` parameter using dot notation.

## 5. Add a method to move windows

- The method should take a `to` parameter of type `Position`.
- It is possible to extract the x and y from the `to` parameter using dot notation.

## 6. Add a method to set the contents of a window

- It is possible to have two methods with the same name but different parameters in Swift.
- Deffine a method with the parameter `title` that sets the `title` property.
- Deffine a method with the parameter `text` that sets the `contents` property.
- Define a display method that prints the window's title and contents.

## 7. Create an initilazer for the Window class

- The class should have two initializers, one that takes no parameters and one that takes parameters.
- The new initializer should have the parameters `title`, and `contents`, it should also allow the optional parameters `size` and `position`
    If no parameters are provided, the default values should be used.
- Optional parameters can be achived by using [default parameters vales][default-parameters-vales].


[structs-and-classes]: https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
[memberwise-initializers]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures/#Memberwise-Initializers-for-Structure-Types
[default-parameters-vales]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions#Default-Parameter-Values
