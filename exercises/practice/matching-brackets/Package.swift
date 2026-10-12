// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "MatchingBrackets",
  products: [
    .library(
      name: "MatchingBrackets",
      targets: ["MatchingBrackets"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "MatchingBrackets",
      dependencies: []),
    .testTarget(
      name: "MatchingBracketsTests",
      dependencies: ["MatchingBrackets"]),
  ]
)
