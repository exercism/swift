// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "PigLatin",
  products: [
    .library(
      name: "PigLatin",
      targets: ["PigLatin"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "PigLatin",
      dependencies: []),
    .testTarget(
      name: "PigLatinTests",
      dependencies: ["PigLatin"]),
  ]
)
