// swift-tools-version:5.3

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
