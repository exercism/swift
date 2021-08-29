# About

[Structs and classes][structs-and-classes] are two of the primary building blocks of Swift programming. They are both means of grouping together related data and functions into self-contained units of functionality. All of the basic types that you have been working with up to this point, such as `Int`, `Double`, and `Character` as well as collection types like `Array`, `String`, and `Dictionary` are actually structs. And when you define a struct or class, you are defining a new type to be used within Swift, just as you used those types.

There are many similarities between structs and classes in Swift. Among other similarities, both are able to store values in _properties_ and provide functionality through the use of _methods_.

For more detailed information, see:

- [concept:swift/structs]()
- [concept:swift/classes]()

## Using structs vs. classes

While it may seem as though classes would be favored in general use over structs in Swift as they offer more functionality and aren't burdened with overhead of copying, the opposite is actually true.

Swift, as a language, opts for preferring safety as a core design principle. And classes are harder to reason about with regard to safety, given that their contents can be changed in unexpected ways thanks to being reference types. Because of this Swift prefers the usage of structs to classes and is optimized in many ways with the assumption that structs will be used in most cases. This is why we see that nearly every type in the standard library and in much of Apple's _Foundation_ library are structs.

But this doesn't mean that classes don't have their uses. In the words of Brent Royal-Gordon, a member of the Swift team at Apple:

> Use a class when the object represents a specific _thing_ that can't be duplicated without consequence; use a struct (or enum) when the instance represents some abstract data with no concrete existence. Some examples using framework types:
>
> - A piece of text is just some data; duplicating it doesn't do anything except maybe use more memory. So `String` should be a struct.
>
> - A label is a particular thing that exists at a particular place on screen; if you duplicated it, you'd end up with two labels on the screen, or with an off-screen copy of a label that wouldn't have any effect when you mutated it. So `UILabel` should be a class.
>
> - A URL is just some data; if you construct two URLs with the same contents, they are completely interchangeable. So `URL` should be a struct.
>
> - A connection to a web server to retrieve the contents of a URL is a particular thing; if you duplicated it, you would either establish another connection, or the two instances would interfere with each other (e.g. canceling one would cancel the other). So `URLSessionTask` and `NSURLConnection` are classes.
>
> Sometimes the same problem, approached in slightly different ways, would allow you to use either one. For instance, a database record is a particular _thing_ and should probably be a class, but copy the values of the fields (perhaps omitting the ID) out of it and suddenly you have a plausible struct. As a _general_ rule, it's usually better to use structs where possible because it's easier to reason about their behavior—mutations in one function don't suddenly pop up in a totally unrelated function—but sometimes a particular type works very easily as a class and very awkwardly as a struct. Ultimately, it's a judgement call.

[structs-and-classes]: https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html
