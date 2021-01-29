// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "RotationalCipher",
    products: [
        .library(
            name: "RotationalCipher",
            targets: ["RotationalCipher"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RotationalCipher",
            dependencies: []),
        .testTarget(
            name: "RotationalCipherTests",
            dependencies: ["RotationalCipher"]),
    ]
)
