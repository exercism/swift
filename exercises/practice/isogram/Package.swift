// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Isogram",
    products: [
        .library(
            name: "Isogram",
            targets: ["Isogram"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Isogram",
            dependencies: []),
        .testTarget(
            name: "IsogramTests",
            dependencies: ["Isogram"]),
    ]
)
