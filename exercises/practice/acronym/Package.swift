// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Acronym",
  products: [
    .library(
      name: "Acronym",
      targets: ["Acronym"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Acronym",
      dependencies: []),
    .testTarget(
      name: "AcronymTests",
      dependencies: ["Acronym"]),
  ]
)
