// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Poker",
  products: [
    .library(
      name: "Poker",
      targets: ["Poker"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Poker",
      dependencies: []),
    .testTarget(
      name: "PokerTests",
      dependencies: ["Poker"]),
  ]
)
