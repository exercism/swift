// swift-tools-version:6.4

import PackageDescription

let package = Package(
    name: "Hexadecimal",
    products: [
        .library(
            name: "Hexadecimal",
            targets: ["Hexadecimal"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Hexadecimal",
            dependencies: []),
        .testTarget(
            name: "HexadecimalTests",
            dependencies: ["Hexadecimal"]),
    ]
)
