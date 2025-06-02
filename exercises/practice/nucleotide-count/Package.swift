// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "NucleotideCount",
  products: [
    .library(
      name: "NucleotideCount",
      targets: ["NucleotideCount"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "NucleotideCount",
      dependencies: []),
    .testTarget(
      name: "NucleotideCountTests",
      dependencies: ["NucleotideCount"]),
  ]
)
