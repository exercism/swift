// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Series",
  products: [
    .library(
      name: "Series",
      targets: ["Series"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Series",
      dependencies: []),
    .testTarget(
      name: "SeriesTests",
      dependencies: ["Series"]),
  ]
)
