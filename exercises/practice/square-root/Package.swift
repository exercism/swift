// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "SquareRoot",
  products: [
    .library(
      name: "SquareRoot",
      targets: ["SquareRoot"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "SquareRoot",
      dependencies: []),
    .testTarget(
      name: "SquareRootTests",
      dependencies: ["SquareRoot"]),
  ]
)