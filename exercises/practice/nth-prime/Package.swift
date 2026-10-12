// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "NthPrime",
  products: [
    .library(
      name: "NthPrime",
      targets: ["NthPrime"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "NthPrime",
      dependencies: []),
    .testTarget(
      name: "NthPrimeTests",
      dependencies: ["NthPrime"]),
  ]
)
