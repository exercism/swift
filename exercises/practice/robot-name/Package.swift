// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "RobotName",
  products: [
    .library(
      name: "RobotName",
      targets: ["RobotName"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "RobotName",
      dependencies: []),
    .testTarget(
      name: "RobotNameTests",
      dependencies: ["RobotName"]),
  ]
)
