// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "PalindromeProducts",
  products: [
    .library(
      name: "PalindromeProducts",
      targets: ["PalindromeProducts"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "PalindromeProducts",
      dependencies: []),
    .testTarget(
      name: "PalindromeProductsTests",
      dependencies: ["PalindromeProducts"]),
  ]
)
