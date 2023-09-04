// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Strain",
  products: [
    .library(
      name: "Strain",
      targets: ["Strain"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Strain",
      dependencies: []),
    .testTarget(
      name: "StrainTests",
      dependencies: ["Strain"]),
  ]
)
