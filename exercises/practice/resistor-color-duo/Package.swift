// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "ResistorColorDuo",
  products: [
    .library(
      name: "ResistorColorDuo",
      targets: ["ResistorColorDuo"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "ResistorColorDuo",
      dependencies: []),
    .testTarget(
      name: "ResistorColorDuoTests",
      dependencies: ["ResistorColorDuo"]),
  ]
)