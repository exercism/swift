// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PascalsTriangle",
    products: [
        .library(
            name: "PascalsTriangle",
            targets: ["PascalsTriangle"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PascalsTriangle",
            dependencies: []),
        .testTarget(
            name: "PascalsTriangleTests",
            dependencies: ["PascalsTriangle"]),
    ]
)
