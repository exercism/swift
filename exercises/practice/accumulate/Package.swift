// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Accumulate",
    products: [
        .library(
            name: "Accumulate",
            targets: ["Accumulate"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Accumulate",
            dependencies: []),
        .testTarget(
            name: "AccumulateTests",
            dependencies: ["Accumulate"]),
    ]
)
