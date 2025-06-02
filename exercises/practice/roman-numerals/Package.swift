// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "RomanNumerals",
  products: [
    .library(
      name: "RomanNumerals",
      targets: ["RomanNumerals"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "RomanNumerals",
      dependencies: []),
    .testTarget(
      name: "RomanNumeralsTests",
      dependencies: ["RomanNumerals"]),
  ]
)
