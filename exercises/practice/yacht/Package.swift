// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "Yacht",
  products: [
    .library(
      name: "Yacht",
      targets: ["Yacht"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Yacht",
      dependencies: []),
    .testTarget(
      name: "YachtTests",
      dependencies: ["Yacht"]),
  ]
)
