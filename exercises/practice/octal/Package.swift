// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Octal",
    products: [
        .library(
            name: "Octal",
            targets: ["Octal"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Octal",
            dependencies: []),
        .testTarget(
            name: "OctalTests",
            dependencies: ["Octal"]),
    ]
)
