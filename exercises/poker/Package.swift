// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Poker",
    products: [
        .library(
            name: "Poker",
            targets: ["Poker"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Poker",
            dependencies: []),
        .testTarget(
            name: "PokerTests",
            dependencies: ["Poker"]),
    ]
)
