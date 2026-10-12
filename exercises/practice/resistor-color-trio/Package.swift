// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "ResistorColorTrio",
  products: [
    .library(
      name: "ResistorColorTrio",
      targets: ["ResistorColorTrio"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "ResistorColorTrio",
      dependencies: []),
    .testTarget(
      name: "ResistorColorTrioTests",
      dependencies: ["ResistorColorTrio"]),
  ]
)