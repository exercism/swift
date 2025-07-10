// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "HighScores",
    products: [
        .library(
            name: "HighScores",
            targets: ["HighScores"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "HighScores",
            dependencies: []),
        .testTarget(
            name: "HighScoresTests",
            dependencies: ["HighScores"]),
    ]
)
