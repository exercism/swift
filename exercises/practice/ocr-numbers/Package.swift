// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "OcrNumbers",
  products: [
    .library(
      name: "OcrNumbers",
      targets: ["OcrNumbers"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "OcrNumbers",
      dependencies: []),
    .testTarget(
      name: "OcrNumbersTests",
      dependencies: ["OcrNumbers"]),
  ]
)
