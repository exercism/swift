// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Sublist",
  products: [
    .library(
      name: "Sublist",
      targets: ["Sublist"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Sublist",
      dependencies: []),
    .testTarget(
      name: "SublistTests",
      dependencies: ["Sublist"]),
  ]
)
