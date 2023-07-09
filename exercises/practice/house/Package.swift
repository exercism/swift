// swift-tools-version:5.3

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
