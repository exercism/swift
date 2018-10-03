// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "ListOps",
    products: [
        .library(
            name: "ListOps",
            targets: ["ListOps"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ListOps",
            dependencies: []),
        .testTarget(
            name: "ListOpsTests",
            dependencies: ["ListOps"]),
    ]
)
