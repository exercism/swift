// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "PythagoreanTriplet",
  products: [
    .library(
      name: "PythagoreanTriplet",
      targets: ["PythagoreanTriplet"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "PythagoreanTriplet",
      dependencies: []),
    .testTarget(
      name: "PythagoreanTripletTests",
      dependencies: ["PythagoreanTriplet"]),
  ]
)
