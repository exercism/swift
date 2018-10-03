// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "KindergartenGarden",
    products: [
        .library(
            name: "KindergartenGarden",
            targets: ["KindergartenGarden"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "KindergartenGarden",
            dependencies: []),
        .testTarget(
            name: "KindergartenGardenTests",
            dependencies: ["KindergartenGarden"]),
    ]
)
