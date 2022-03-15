// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ScrabbleScore",
    products: [
        .library(
            name: "ScrabbleScore",
            targets: ["ScrabbleScore"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ScrabbleScore",
            dependencies: []),
        .testTarget(
            name: "ScrabbleScoreTests",
            dependencies: ["ScrabbleScore"]),
    ]
)
