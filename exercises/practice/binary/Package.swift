// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Binary",
    products: [
        .library(
            name: "Binary",
            targets: ["Binary"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Binary",
            dependencies: []),
        .testTarget(
            name: "BinaryTests",
            dependencies: ["Binary"]),
    ]
)
