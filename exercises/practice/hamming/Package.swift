// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Hamming",
  products: [
    .library(
      name: "Hamming",
      targets: ["Hamming"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Hamming",
      dependencies: []),
    .testTarget(
      name: "HammingTests",
      dependencies: ["Hamming"]),
  ]
)
