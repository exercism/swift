// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "ProteinTranslation",
  products: [
    .library(
      name: "ProteinTranslation",
      targets: ["ProteinTranslation"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "ProteinTranslation",
      dependencies: []),
    .testTarget(
      name: "ProteinTranslationTests",
      dependencies: ["ProteinTranslation"]),
  ]
)
