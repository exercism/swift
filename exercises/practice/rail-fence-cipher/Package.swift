// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "RailFenceCipher",
  products: [
    .library(
      name: "RailFenceCipher",
      targets: ["RailFenceCipher"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "RailFenceCipher",
      dependencies: []),
    .testTarget(
      name: "RailFenceCipherTests",
      dependencies: ["RailFenceCipher"]),
  ]
)
