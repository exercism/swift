// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Anagram",
  products: [
    .library(
      name: "Anagram",
      targets: ["Anagram"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Anagram",
      dependencies: []),
    .testTarget(
      name: "AnagramTests",
      dependencies: ["Anagram"]),
  ]
)
