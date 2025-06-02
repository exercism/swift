// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Triangle",
  products: [
    .library(
      name: "Triangle",
      targets: ["Triangle"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Triangle",
      dependencies: []),
    .testTarget(
      name: "TriangleTests",
      dependencies: ["Triangle"]),
  ]
)
