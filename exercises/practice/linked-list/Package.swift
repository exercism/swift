// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "LinkedList",
  products: [
    .library(
      name: "LinkedList",
      targets: ["LinkedList"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "LinkedList",
      dependencies: []),
    .testTarget(
      name: "LinkedListTests",
      dependencies: ["LinkedList"]),
  ]
)
