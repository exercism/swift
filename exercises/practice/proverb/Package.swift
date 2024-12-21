// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Proverb",
  products: [
    .library(
      name: "Proverb",
      targets: ["Proverb"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Proverb",
      dependencies: []),
    .testTarget(
      name: "ProverbTests",
      dependencies: ["Proverb"]),
  ]
)
