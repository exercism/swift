// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "ScaleGenerator",
  products: [
    .library(
      name: "ScaleGenerator",
      targets: ["ScaleGenerator"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "ScaleGenerator",
      dependencies: []),
    .testTarget(
      name: "ScaleGeneratorTests",
      dependencies: ["ScaleGenerator"]),
  ]
)
