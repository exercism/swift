// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "GameOfLife",
  products: [
    .library(
      name: "GameOfLife",
      targets: ["GameOfLife"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "GameOfLife",
      dependencies: []),
    .testTarget(
      name: "GameOfLifeTests",
      dependencies: ["GameOfLife"]),
  ]
)
