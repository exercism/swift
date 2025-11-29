// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "DndCharacter",
  products: [
    .library(
      name: "DndCharacter",
      targets: ["DndCharacter"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "DndCharacter",
      dependencies: []),
    .testTarget(
      name: "DndCharacterTests",
      dependencies: ["DndCharacter"]),
  ]
)