// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Series",
    products: [
        .library(
            name: "Series",
            targets: ["Series"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Series",
            dependencies: []),
        .testTarget(
            name: "SeriesTests",
            dependencies: ["Series"]),
    ]
)
