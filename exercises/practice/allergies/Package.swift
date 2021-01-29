// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Allergies",
    products: [
        .library(
            name: "Allergies",
            targets: ["Allergies"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Allergies",
            dependencies: []),
        .testTarget(
            name: "AllergiesTests",
            dependencies: ["Allergies"]),
    ]
)
