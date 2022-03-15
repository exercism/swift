// swift-tools-version:5.3

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
