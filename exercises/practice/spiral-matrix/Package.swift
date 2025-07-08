// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "SpiralMatrix",
  products: [
    .library(
      name: "SpiralMatrix",
      targets: ["SpiralMatrix"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "SpiralMatrix",
      dependencies: []),
    .testTarget(
      name: "SpiralMatrixTests",
      dependencies: ["SpiralMatrix"]),
  ]
)
