// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "ResistorColor",
  products: [
    .library(
      name: "ResistorColor",
      targets: ["ResistorColor"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "ResistorColor",
      dependencies: []),
    .testTarget(
      name: "ResistorColorTests",
      dependencies: ["ResistorColor"]),
  ]
)
