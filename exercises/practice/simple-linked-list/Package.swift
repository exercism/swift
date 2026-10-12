// swift-tools-version:6.4

import PackageDescription

let package = Package(
  name: "SimpleLinkedList",
  products: [
    .library(
      name: "SimpleLinkedList",
      targets: ["SimpleLinkedList"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "SimpleLinkedList",
      dependencies: []),
    .testTarget(
      name: "SimpleLinkedListTests",
      dependencies: ["SimpleLinkedList"]),
  ]
)
