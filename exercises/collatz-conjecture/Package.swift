// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "CollatzConjecture",
    products: [
        .library(
            name: "CollatzConjecture",
            targets: ["CollatzConjecture"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CollatzConjecture",
            dependencies: []),
        .testTarget(
            name: "CollatzConjectureTests",
            dependencies: ["CollatzConjecture"]),
    ]
)
