// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "PhoneNumber",
  products: [
    .library(
      name: "PhoneNumber",
      targets: ["PhoneNumber"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "PhoneNumber",
      dependencies: []),
    .testTarget(
      name: "PhoneNumberTests",
      dependencies: ["PhoneNumber"]),
  ]
)
