// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Luhn",
  products: [
    .library(
      name: "Luhn",
      targets: ["Luhn"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Luhn",
      dependencies: []),
    .testTarget(
      name: "LuhnTests",
      dependencies: ["Luhn"]),
  ]
)
