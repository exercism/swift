// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "BinarySearchTree",
    products: [
        .library(
            name: "BinarySearchTree",
            targets: ["BinarySearchTree"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BinarySearchTree",
            dependencies: []),
        .testTarget(
            name: "BinarySearchTreeTests",
            dependencies: ["BinarySearchTree"]),
    ]
)
