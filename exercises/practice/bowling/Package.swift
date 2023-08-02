// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Bowling",
  products: [
    .library(
      name: "Bowling",
      targets: ["Bowling"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Bowling",
      dependencies: []),
    .testTarget(
      name: "BowlingTests",
      dependencies: ["Bowling"]),
  ]
)
