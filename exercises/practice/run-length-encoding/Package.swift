// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "RunLengthEncoding",
  products: [
    .library(
      name: "RunLengthEncoding",
      targets: ["RunLengthEncoding"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "RunLengthEncoding",
      dependencies: []),
    .testTarget(
      name: "RunLengthEncodingTests",
      dependencies: ["RunLengthEncoding"]),
  ]
)
