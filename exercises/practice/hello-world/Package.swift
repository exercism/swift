// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "HelloWorld",
  products: [
    .library(
      name: "HelloWorld",
      targets: ["HelloWorld"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "HelloWorld",
      dependencies: []),
    .testTarget(
      name: "HelloWorldTests",
      dependencies: ["HelloWorld"]),
  ]
)
