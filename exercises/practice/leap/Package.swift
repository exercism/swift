// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Leap",
  products: [
    .library(
      name: "Leap",
      targets: ["Leap"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Leap",
      dependencies: []),
    .testTarget(
      name: "LeapTests",
      dependencies: ["Leap"]),
  ]
)
