// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "PerfectNumbers",
  products: [
    .library(
      name: "PerfectNumbers",
      targets: ["PerfectNumbers"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "PerfectNumbers",
      dependencies: []),
    .testTarget(
      name: "PerfectNumbersTests",
      dependencies: ["PerfectNumbers"]),
  ]
)
