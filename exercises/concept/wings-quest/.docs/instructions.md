# Instructions

You are in process of developing the new highly appreciated game **Wings Quest**.
In the game you are a bird that moves around and collects seeds.
The player wins by picking up all the seeds.
If the player comes in contact with an eagle, then the player will lose all their seeds and lose the game.
There is an exception to this rule: the player can have an active power-up that makes them fly higher than other birds.

Your goal is to write some rules that will be used in the game.

## 1. Define if bird gets bonus points

In the game, the bird will get bonus points if they touch an eagle while having a power-up.

Define the function `bonusPoints(powerUpActive:touchingEagle:)` that takes two arguments (_if the bird has an active power-up_ and _if the bird is touching an eagle_) and returns a boolean value that tells whether the bird will get bonus points or not.
The function should return `true` only if the bird has a power-up active and is touching an eagle, and `false` otherwise.

```Swift
bonusPoints(powerUpActive: false, touchingEagle: true)
// Returns false
```

## 2. Define if bird scores

In the game, the player gets points when picking up a seed or a power-up.

Define the function `score(touchingPowerUp:touchingSeed:)` that takes two arguments (_if the bird is touching a power-up_ and _if the bird is touching a seed_) and returns a boolean value indicating if the bird scored or not.
The function should return `true` if the bird is touching a power-up or a seed, and return `false` otherwise.

```Swift
score(touchingPowerUp: true, touchingSeed: true)
// Returns true
```

## 3. Define if bird loses

Define the function `lose(powerUpActive:touchingEagle:)` that takes two arguments (_if the bird has a power-up active_ and _if the bird is touching an eagle_) and returns a boolean value that indicates if the bird loses or not.
The function should return `true` if the character is an eagle and does not have a power-up active, and return `false` otherwise.

```Swift
lose(powerUpActive: false, touchingEagle: true)
// Returns true
```

## 4. Define if bird wins

Define the `win(HasPickedUpAllSeeds:powerUpActive:touchingEagle:)` function that takes three arguments (_if the bird has picked up all of the seeds, _if the bird has a power-up active_, and _if the bird is an eagle) and returns a boolean value indicating if the bird wins or not.
The function should return `true` if the bird has gathered all of the seeds and has not lost based on the arguments defined in part 3, and return `false` otherwise.

```Swift
win(HasPickedUpAllSeeds: false, powerUpActive: true, touchingEagle: false)
// Returns false
```
