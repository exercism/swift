// swift-tools-version:5.3

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
