// swift-tools-version:5.3

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
