// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "Grains",
  products: [
    .library(
      name: "Grains",
      targets: ["Grains"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Grains",
      dependencies: []),
    .testTarget(
      name: "GrainsTests",
      dependencies: ["Grains"]),
  ]
)
