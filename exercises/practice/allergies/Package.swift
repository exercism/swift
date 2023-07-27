// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Allergies",
  products: [
    .library(
      name: "Allergies",
      targets: ["Allergies"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Allergies",
      dependencies: []),
    .testTarget(
      name: "AllergiesTests",
      dependencies: ["Allergies"]),
  ]
)
