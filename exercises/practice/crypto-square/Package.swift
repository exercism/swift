// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "CryptoSquare",
  products: [
    .library(
      name: "CryptoSquare",
      targets: ["CryptoSquare"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "CryptoSquare",
      dependencies: []),
    .testTarget(
      name: "CryptoSquareTests",
      dependencies: ["CryptoSquare"]),
  ]
)
