// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Pangram",
  products: [
    .library(
      name: "Pangram",
      targets: ["Pangram"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Pangram",
      dependencies: []),
    .testTarget(
      name: "PangramTests",
      dependencies: ["Pangram"]),
  ]
)
