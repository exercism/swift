// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "WordSearch",
  products: [
    .library(
      name: "WordSearch",
      targets: ["WordSearch"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "WordSearch",
      dependencies: []),
    .testTarget(
      name: "WordSearchTests",
      dependencies: ["WordSearch"]),
  ]
)
