// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "FlowerField",
  products: [
    .library(
      name: "FlowerField",
      targets: ["FlowerField"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "FlowerField",
      dependencies: []),
    .testTarget(
      name: "FlowerFieldTests",
      dependencies: ["FlowerField"]),
  ]
)
