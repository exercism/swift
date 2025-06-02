// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "CollatzConjecture",
  products: [
    .library(
      name: "CollatzConjecture",
      targets: ["CollatzConjecture"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "CollatzConjecture",
      dependencies: []),
    .testTarget(
      name: "CollatzConjectureTests",
      dependencies: ["CollatzConjecture"]),
  ]
)
