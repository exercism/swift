// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "Knapsack",
  products: [
    .library(
      name: "Knapsack",
      targets: ["Knapsack"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Knapsack",
      dependencies: []),
    .testTarget(
      name: "KnapsackTests",
      dependencies: ["Knapsack"]),
  ]
)
