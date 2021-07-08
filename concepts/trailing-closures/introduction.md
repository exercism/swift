# Introduction

Swift offers a variation of its syntax when dealing with closures, known as trailing closures. Trailing closures arise when the last parameter in a function's list of parameters has a function type. In this case, if one is passing in a closure, the closure can be written _after_ the closing parenthesis and the argument label is omitted. Note that if there is only one parameter for the function, the parentheses may be omitted entirely.

```swift
func fetchURL(_ urlString: String,
              uponReceipt handleResult: (String) -> ()
             )  -> () {
  if let url = URL(string: urlString), let htmlString = fetch(url) {
    handleResult(htmlString)
  }
}

fetchURL("https://www.swift.org") { print($0) }
// prints the fetched html string

["apple", "ball", "carrot"].sorted { $0.count < $1.count }
```
