// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "CircularBuffer",
  products: [
    .library(
      name: "CircularBuffer",
      targets: ["CircularBuffer"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "CircularBuffer",
      dependencies: []),
    .testTarget(
      name: "CircularBufferTests",
      dependencies: ["CircularBuffer"]),
  ]
)
