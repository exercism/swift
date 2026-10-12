// swift-tools-version:6.4

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
