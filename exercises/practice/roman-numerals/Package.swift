// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "RomanNumerals",
    products: [
        .library(
            name: "RomanNumerals",
            targets: ["RomanNumerals"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RomanNumerals",
            dependencies: []),
        .testTarget(
            name: "RomanNumeralsTests",
            dependencies: ["RomanNumerals"]),
    ]
)
