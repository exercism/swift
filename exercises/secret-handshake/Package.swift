// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "SecretHandshake",
    products: [
        .library(
            name: "SecretHandshake",
            targets: ["SecretHandshake"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SecretHandshake",
            dependencies: []),
        .testTarget(
            name: "SecretHandshakeTests",
            dependencies: ["SecretHandshake"]),
    ]
)
