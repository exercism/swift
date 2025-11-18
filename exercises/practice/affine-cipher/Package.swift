// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "AffineCipher",
  products: [
    .library(
      name: "AffineCipher",
      targets: ["AffineCipher"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "AffineCipher",
      dependencies: []),
    .testTarget(
      name: "AffineCipherTests",
      dependencies: ["AffineCipher"]),
  ]
)
