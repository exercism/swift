// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "Bob",
  products: [
    .library(
      name: "Bob",
      targets: ["Bob"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Bob",
      dependencies: []),
    .testTarget(
      name: "BobTests",
      dependencies: ["Bob"]),
  ]
)
