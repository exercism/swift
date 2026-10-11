# Introduction

In Swift, closures and functions can access constants and variables from their surrounding scope.
They can also keep access to these values even after the surrounding scope has finished executing.
This behavior is called [_capturing values_][capturing-values].

```swift
func makeAdder(base: Int) -> (Int) -> Int {
    func adder(_ i: Int) -> Int {
        base + i
    }
    return adder
}
// makeAdder: (Int) -> (Int) -> Int

let add10 = makeAdder(base: 10)
// add10: (Int) -> Int

let subtract20 = makeAdder(base: -20)
// subtract20: (Int) -> Int

add10(5)
// => 15

subtract20(5)
// => -15

func makeLogger(logLevel: String) -> (String) -> Void {
    let logHeader = "[\(logLevel)]: "
    return { msg in print(logHeader, msg) }
}
// makeLogger: (String) -> (String) -> Void

let infoLogger = makeLogger(logLevel: "info")
// infoLogger: (String) -> Void

infoLogger("This is a log message")
// prints "[info]: This is a log message"
```

In the examples above, both `makeAdder(base:)` and `makeLogger(logLevel:)` return functions or closures that capture values from their enclosing scope.
The returned functions continue to reference `base` and `logHeader` even after `makeAdder(base:)` and `makeLogger(logLevel:)` have returned.

[capturing-values]: https://docs.swift.org/swift-book/LanguageGuide/Closures.html#ID103
