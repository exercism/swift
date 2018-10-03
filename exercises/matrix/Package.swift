// swift-tools-version:4.2

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
