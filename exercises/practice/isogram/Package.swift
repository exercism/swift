// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Isogram",
  products: [
    .library(
      name: "Isogram",
      targets: ["Isogram"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Isogram",
      dependencies: []),
    .testTarget(
      name: "IsogramTests",
      dependencies: ["Isogram"]),
  ]
)
