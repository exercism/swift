// swift-tools-version:4.2

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
