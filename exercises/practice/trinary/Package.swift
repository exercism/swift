// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Trinary",
    products: [
        .library(
            name: "Trinary",
            targets: ["Trinary"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Trinary",
            dependencies: []),
        .testTarget(
            name: "TrinaryTests",
            dependencies: ["Trinary"]),
    ]
)
