// swift-tools-version:5.3

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
