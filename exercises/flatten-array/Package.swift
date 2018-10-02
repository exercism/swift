// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "FlattenArray",
    products: [
        .library(
            name: "FlattenArray",
            targets: ["FlattenArray"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FlattenArray",
            dependencies: []),
        .testTarget(
            name: "FlattenArrayTests",
            dependencies: ["FlattenArray"]),
    ]
)
