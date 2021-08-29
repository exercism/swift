// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "RnaTranscription",
    products: [
        .library(
            name: "RnaTranscription",
            targets: ["RnaTranscription"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RnaTranscription",
            dependencies: []),
        .testTarget(
            name: "RnaTranscriptionTests",
            dependencies: ["RnaTranscription"]),
    ]
)
