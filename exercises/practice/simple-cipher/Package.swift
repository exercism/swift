// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SimpleCipher",
    products: [
        .library(
            name: "SimpleCipher",
            targets: ["SimpleCipher"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SimpleCipher",
            dependencies: []),
        .testTarget(
            name: "SimpleCipherTests",
            dependencies: ["SimpleCipher"]),
    ]
)
