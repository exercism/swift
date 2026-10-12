// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "TwoFer",
  products: [
    .library(
      name: "TwoFer",
      targets: ["TwoFer"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "TwoFer",
      dependencies: []),
    .testTarget(
      name: "TwoFerTests",
      dependencies: ["TwoFer"]),
  ]
)
