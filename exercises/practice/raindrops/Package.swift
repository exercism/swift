// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Raindrops",
  products: [
    .library(
      name: "Raindrops",
      targets: ["Raindrops"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Raindrops",
      dependencies: []),
    .testTarget(
      name: "RaindropsTests",
      dependencies: ["Raindrops"]),
  ]
)
