// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Clock",
  products: [
    .library(
      name: "Clock",
      targets: ["Clock"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Clock",
      dependencies: []),
    .testTarget(
      name: "ClockTests",
      dependencies: ["Clock"]),
  ]
)
