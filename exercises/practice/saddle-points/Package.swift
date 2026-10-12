// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "SaddlePoints",
  products: [
    .library(
      name: "SaddlePoints",
      targets: ["SaddlePoints"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "SaddlePoints",
      dependencies: []),
    .testTarget(
      name: "SaddlePointsTests",
      dependencies: ["SaddlePoints"]),
  ]
)
