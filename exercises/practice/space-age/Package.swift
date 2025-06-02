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
    .package(url: "https://github.com/apple/swift-numerics", from: "1.0.3"),
  ],
  targets: [
    .target(
      name: "SpaceAge"),
    .testTarget(
      name: "SpaceAgeTests",
      dependencies: [.product(name: "RealModule", package: "swift-numerics"), "SpaceAge"]),
  ]
)
