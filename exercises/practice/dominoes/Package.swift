// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Dominoes",
  products: [
    .library(
      name: "Dominoes",
      targets: ["Dominoes"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Dominoes",
      dependencies: []),
    .testTarget(
      name: "DominoesTests",
      dependencies: ["Dominoes"]),
  ]
)
