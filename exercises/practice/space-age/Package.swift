// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "SpaceAge",
  products: [
    .library(
      name: "SpaceAge",
      targets: ["SpaceAge"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-numerics", from: "1.0.2"),
  ],
  targets: [
    .target(
      name: "SpaceAge",
      dependencies: [.product(name: "Numerics", package: "swift-numerics")]),
    .testTarget(
      name: "SpaceAgeTests",
      dependencies: [.product(name: "Numerics", package: "swift-numerics"), "SpaceAge"]),
  ]
)
