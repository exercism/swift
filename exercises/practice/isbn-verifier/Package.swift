// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "IsbnVerifier",
  products: [
    .library(
      name: "IsbnVerifier",
      targets: ["IsbnVerifier"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "IsbnVerifier",
      dependencies: []),
    .testTarget(
      name: "IsbnVerifierTests",
      dependencies: ["IsbnVerifier"]),
  ]
)
