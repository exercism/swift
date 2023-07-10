// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Say",
    products: [
        .library(
            name: "Say",
            targets: ["Say"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Say",
            dependencies: []),
        .testTarget(
            name: "SayTests",
            dependencies: ["Say"]),
    ]
)
