// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "ReverseString",
  products: [
    .library(
      name: "ReverseString",
      targets: ["ReverseString"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "ReverseString",
      dependencies: []),
    .testTarget(
      name: "ReverseStringTests",
      dependencies: ["ReverseString"]),
  ]
)
