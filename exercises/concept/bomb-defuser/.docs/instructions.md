# Instructions

Hello again, Agent Double-Null0111.

The forces of UMBRA are acting up again, and it is up to you to foil their latest scheme. Our intel branch informs us that those Minions are planning to set off a stink-bomb at the Governor's ball.

Since the minions are so clumsy, they often accidentally arm the stink-bombs in their labs and offices. And because they keep forgetting how to disarm their stink-bombs, they require a system to generate the disarming instructions. The instructions will give the order in which the wires must be cut from a bomb's ID number and disarm it.

Your job is to write the code that will allow you to disarm the stink-bomb at the ball before it goes off.

## 1. Write a closure `flip` to flip two wires

There are three differently colored wires on each stink-bomb. Write a closure that takes a `(String, String, String)` tuple and returns the tuple with the order of the first two elements flipped.

```swift
flip(("red", "yellow", "blue"))
// => ("yellow", "red", "blue")
```

## 2. Write a closure `rotate` to rotate the wires

Write a closure that takes a `(String, String, String)` tuple and returns the tuple with the order of the wires rotated to the left.

```swift
rotate(("red", "yellow", "blue"))
// => ("yellow", "blue", "red")
```

## 3. Implement a wire shuffle generator

In order to figure out the order in which to cut the stink-bomb wires, you will need to implement a function that generates the proper shuffling function based on the ID number of the stink-bomb.

Implement a function `makeShuffle`:

```swift
makeShuffle(
  flipper: @escaping ((String, String, String)) -> (String, String, String),
  rotator: @escaping ((String, String, String)) -> (String, String, String)
) -> (UInt8, (String, String, String)) -> (String, String, String)
```

which takes as input a closure that flips two wires and a closure that rotates the three wires and returns a closure. This returned closure takes the ID number of the stink-bomb and the order of the three wires, and then computes the order the wires need to be cut. For each bit in the ID number, starting with the leftmost bit, you will apply the `flipper` closure to the wires tuple if the bit is a 0 and you will apply the rotator closure if it is a 1 giving the new state of the wires. After the appropriate closures have been applied for all eight bits of the ID, the final state of the wires is the order they need to be cut in.

```swift
let shuffler = makeShuffle(flipper: flip, rotator: rotate)
// => (UInt8, (String, String, String)) -> (String, String, String)
shuffler(155, ("red", "yellow", "blue"))
// => ("red", "blue", "yellow")
```
