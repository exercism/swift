// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "House",
    products: [
        .library(
            name: "House",
            targets: ["House"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "House",
            dependencies: []),
        .testTarget(
            name: "HouseTests",
            dependencies: ["House"]),
    ]
)
