// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Gigasecond",
  products: [
    .library(
      name: "Gigasecond",
      targets: ["Gigasecond"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Gigasecond",
      dependencies: []),
    .testTarget(
      name: "GigasecondTests",
      dependencies: ["Gigasecond"]),
  ]
)
