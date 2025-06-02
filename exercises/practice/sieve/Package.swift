// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Sieve",
  products: [
    .library(
      name: "Sieve",
      targets: ["Sieve"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Sieve",
      dependencies: []),
    .testTarget(
      name: "SieveTests",
      dependencies: ["Sieve"]),
  ]
)
