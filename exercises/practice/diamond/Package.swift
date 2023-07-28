// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Diamond",
  products: [
    .library(
      name: "Diamond",
      targets: ["Diamond"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Diamond",
      dependencies: []),
    .testTarget(
      name: "DiamondTests",
      dependencies: ["Diamond"]),
  ]
)
