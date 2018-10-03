// swift-tools-version:4.2

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
