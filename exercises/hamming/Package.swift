// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Hamming",
    products: [
        .library(
            name: "Hamming",
            targets: ["Hamming"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Hamming",
            dependencies: []),
        .testTarget(
            name: "HammingTests",
            dependencies: ["Hamming"]),
    ]
)
