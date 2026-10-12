// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "QueenAttack",
  products: [
    .library(
      name: "QueenAttack",
      targets: ["QueenAttack"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "QueenAttack",
      dependencies: []),
    .testTarget(
      name: "QueenAttackTests",
      dependencies: ["QueenAttack"]),
  ]
)
