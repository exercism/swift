// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Matrix",
    products: [
        .library(
            name: "Matrix",
            targets: ["Matrix"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Matrix",
            dependencies: []),
        .testTarget(
            name: "MatrixTests",
            dependencies: ["Matrix"]),
    ]
)
