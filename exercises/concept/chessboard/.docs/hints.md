# Hints

## 1. Define rank & file range

- There is an [operator][swift-range-docs] for creating a range, which can be used for both characters and integers.

## 2. Check if square is valid

- There is an [method][contains-docs] for checking if a value is inside of a range.

## 3. Get row

- Each row should have the length of 8.
- For every row, starting from 1, will you have to offset the start and end by 8.
- You can use a range to get a subarray of the array.

[swift-range-docs]: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/#Range-Operators
[contains-docs]: https://developer.apple.com/documentation/swift/range/contains(_:)-76nb4
