// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "BottleSong",
  products: [
    .library(
      name: "BottleSong",
      targets: ["BottleSong"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "BottleSong",
      dependencies: []),
    .testTarget(
      name: "BottleSongTests",
      dependencies: ["BottleSong"]),
  ]
)
