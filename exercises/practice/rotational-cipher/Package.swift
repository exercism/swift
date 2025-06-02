// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "RotationalCipher",
  products: [
    .library(
      name: "RotationalCipher",
      targets: ["RotationalCipher"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "RotationalCipher",
      dependencies: []),
    .testTarget(
      name: "RotationalCipherTests",
      dependencies: ["RotationalCipher"]),
  ]
)
