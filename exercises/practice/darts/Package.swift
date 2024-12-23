// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Darts",
  products: [
    .library(
      name: "Darts",
      targets: ["Darts"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Darts",
      dependencies: []),
    .testTarget(
      name: "DartsTests",
      dependencies: ["Darts"]),
  ]
)
