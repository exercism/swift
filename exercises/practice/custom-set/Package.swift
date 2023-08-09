// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "CustomSet",
  products: [
    .library(
      name: "CustomSet",
      targets: ["CustomSet"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "CustomSet",
      dependencies: []),
    .testTarget(
      name: "CustomSetTests",
      dependencies: ["CustomSet"]),
  ]
)
