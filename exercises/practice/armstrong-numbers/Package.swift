// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "ArmstrongNumbers",
  products: [
    .library(
      name: "ArmstrongNumbers",
      targets: ["ArmstrongNumbers"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "ArmstrongNumbers",
      dependencies: []),
    .testTarget(
      name: "ArmstrongNumbersTests",
      dependencies: ["ArmstrongNumbers"]),
  ]
)
