// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "DifferenceOfSquares",
  products: [
    .library(
      name: "DifferenceOfSquares",
      targets: ["DifferenceOfSquares"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "DifferenceOfSquares",
      dependencies: []),
    .testTarget(
      name: "DifferenceOfSquaresTests",
      dependencies: ["DifferenceOfSquares"]),
  ]
)
