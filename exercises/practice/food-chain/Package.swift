// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "FoodChain",
  products: [
    .library(
      name: "FoodChain",
      targets: ["FoodChain"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "FoodChain",
      dependencies: []),
    .testTarget(
      name: "FoodChainTests",
      dependencies: ["FoodChain"]),
  ]
)
