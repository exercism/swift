# Introduction

Sometimes it is necessary to skip to the next iteration of a loop early, without completing the rest of the statements in the current iteration of the loop. The `continue` keyword can be used for this. When `continue` is executed, the loop jump to the next check to see if the next iteration of the loop can be run, i.e. the `while` in while and repeat-while loops or the check if there's another element in the sequence in for-in loops.

```swift
count = 1
repeat {
  count += 1
  if count == 4 { continue }
  print(count)
} while count !=4 && count < 6
```

prints:

```
2
3
```

rather than:

```
2
3
5
6
```
