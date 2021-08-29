// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "BracketPush",
    products: [
        .library(
            name: "BracketPush",
            targets: ["BracketPush"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BracketPush",
            dependencies: []),
        .testTarget(
            name: "BracketPushTests",
            dependencies: ["BracketPush"]),
    ]
)
