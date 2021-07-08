# Introduction

While the else-if variant of `if` statements cleans things up considerably, there is still a lot of noise in the code from all of the curly braces. This is where the `switch` statement comes into play. In conditional statements with many possible branches, the switch statement shines. Note, however, that `switch` statements do work a bit differently from `if` statements.

Rather than evaluating a Boolean expression and using the value of that expression to choose the code branch that is run, a simple switch statement takes an input value (or expression which it evaluates to obtain the input value) of some type and compares against one or more values of the same type. If a case is found that matches the input value, the corresponding block of code is run.

```swift
switch str {
case "apple":
    print("Let's bake an apple crumble")
case "lemon":
    print("Let's bake a lemon meringue pie!")
case "peach":
    print("Let's bake a peach pie!")
default:
    print("Let's buy ice cream.")
}
```
