// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "RnaTranscription",
  products: [
    .library(
      name: "RnaTranscription",
      targets: ["RnaTranscription"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "RnaTranscription",
      dependencies: []),
    .testTarget(
      name: "RnaTranscriptionTests",
      dependencies: ["RnaTranscription"]),
  ]
)
