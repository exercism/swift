// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Wordy",
  products: [
    .library(
      name: "Wordy",
      targets: ["Wordy"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Wordy",
      dependencies: []),
    .testTarget(
      name: "WordyTests",
      dependencies: ["Wordy"]),
  ]
)
