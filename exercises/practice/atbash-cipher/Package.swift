// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "AtbashCipher",
    products: [
        .library(
            name: "AtbashCipher",
            targets: ["AtbashCipher"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AtbashCipher",
            dependencies: []),
        .testTarget(
            name: "AtbashCipherTests",
            dependencies: ["AtbashCipher"]),
    ]
)
