// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "PrimeFactors",
  products: [
    .library(
      name: "PrimeFactors",
      targets: ["PrimeFactors"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "PrimeFactors",
      dependencies: []),
    .testTarget(
      name: "PrimeFactorsTests",
      dependencies: ["PrimeFactors"]),
  ]
)
