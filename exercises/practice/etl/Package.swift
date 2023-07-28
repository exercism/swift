// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Etl",
  products: [
    .library(
      name: "Etl",
      targets: ["Etl"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Etl",
      dependencies: []),
    .testTarget(
      name: "EtlTests",
      dependencies: ["Etl"]),
  ]
)
