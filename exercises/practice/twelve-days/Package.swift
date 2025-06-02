// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "TwelveDays",
  products: [
    .library(
      name: "TwelveDays",
      targets: ["TwelveDays"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "TwelveDays",
      dependencies: []),
    .testTarget(
      name: "TwelveDaysTests",
      dependencies: ["TwelveDays"]),
  ]
)
