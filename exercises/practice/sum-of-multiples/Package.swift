// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "SumOfMultiples",
  products: [
    .library(
      name: "SumOfMultiples",
      targets: ["SumOfMultiples"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "SumOfMultiples",
      dependencies: []),
    .testTarget(
      name: "SumOfMultiplesTests",
      dependencies: ["SumOfMultiples"]),
  ]
)
