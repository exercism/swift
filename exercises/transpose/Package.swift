// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Transpose",
    products: [
        .library(
            name: "Transpose",
            targets: ["Transpose"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Transpose",
            dependencies: []),
        .testTarget(
            name: "TransposeTests",
            dependencies: ["Transpose"]),
    ]
)
