# Instructions

As a chess enthusiast, you want to write your version of the game.
Yes, there may be plenty of implementations of chess available online already, but yours will be unique!

You start with implementing a chess board.

The chess game will be played on an eight-square wide and eight-square long board.
The squares are identified by a letter and a number.

## 1. Define rank & file range

The game will have to store the ranks of the board.
The ranks are the rows of the board, and are numbered from 1 to 8.

The game will also have to store the files on the board.
The files are the board's columns and are identified by the letters A to H.

Define the `ranks` and `files` constants that store the range of ranks and files respectively.

```swift
ranks
// Returns 1..8

files
// Returns 'A'..'H'
```

## 2. Check if square is valid

The game will have to check if a square is valid.
A square is valid if the rank and file are within the ranges of the ranks and files.

Define the `isValidSquare(rank:file:)` method that takes the arguments `rank` that holds an int of the rank and `file` that holds a char of the file.
The method should return `true` if the rank and file are within the range of ranks and files, and return `false` otherwise.

```swift
isValidSquare(rank: 1, file: "A")
// Returns true
```

## 3. Get row

The game will store all the squares of the board in a single dimensional array.
The squares are formed as a string of the rank and file, e.g. "1A", "8B", "4G", etc.
To get the row of a square, the game will have to calculate the index of the first square of the row.

Define the `getRow(rank:)` method that takes the argument `rank` that holds an int of the rank.
The method should return an array of strings that represent the squares of the row.

```swift
let board = ["1A", "1B", "1C", "1D", "1E", "1F", "1G", "1H", "2A", ..., "8H"]
getRow(board, rank: 1)
// returns ["1A", "1B", "1C", "1D", "1E", "1F", "1G", "1H"]
```
