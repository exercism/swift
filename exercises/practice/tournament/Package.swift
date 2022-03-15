// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Tournament",
    products: [
        .library(
            name: "Tournament",
            targets: ["Tournament"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Tournament",
            dependencies: []),
        .testTarget(
            name: "TournamentTests",
            dependencies: ["Tournament"]),
    ]
)
