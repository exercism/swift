// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "SgfParsing",
  products: [
    .library(
      name: "SgfParsing",
      targets: ["SgfParsing"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "SgfParsing",
      dependencies: []),
    .testTarget(
      name: "SgfParsingTests",
      dependencies: ["SgfParsing"]),
  ]
)
