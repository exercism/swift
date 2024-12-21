// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "WordCount",
  products: [
    .library(
      name: "WordCount",
      targets: ["WordCount"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "WordCount",
      dependencies: []),
    .testTarget(
      name: "WordCountTests",
      dependencies: ["WordCount"]),
  ]
)
