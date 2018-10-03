// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "SpaceAge",
    products: [
        .library(
            name: "SpaceAge",
            targets: ["SpaceAge"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SpaceAge",
            dependencies: []),
        .testTarget(
            name: "SpaceAgeTests",
            dependencies: ["SpaceAge"]),
    ]
)
