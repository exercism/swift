// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "MatchingBrackets",
    products: [
        .library(
            name: "MatchingBrackets",
            targets: ["MatchingBrackets"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MatchingBrackets",
            dependencies: []),
        .testTarget(
            name: "MatchingBracketsTests",
            dependencies: ["MatchingBrackets"]),
    ]
)
