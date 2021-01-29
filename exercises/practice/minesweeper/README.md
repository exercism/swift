# Minesweeper

Add the numbers to a minesweeper board.

Minesweeper is a popular game where the user has to find the mines using
numeric hints that indicate how many mines are directly adjacent
(horizontally, vertically, diagonally) to a square.

In this exercise you have to create some code that counts the number of
mines adjacent to a square and transforms boards like this (where `*`
indicates a mine):

    +-----+
    | * * |
    |  *  |
    |  *  |
    |     |
    +-----+

into this:

    +-----+
    |1*3*1|
    |13*31|
    | 2*2 |
    | 111 |
    +-----+

## Setup

Go through the project setup instructions for Xcode using Swift:

http://exercism.io/languages/swift  
http://exercism.io/languages/swift/tests

Notably from the source directory:

`swift test` runs tests  
`swift package generate-xcodeproj` creates an Xcode project


## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
