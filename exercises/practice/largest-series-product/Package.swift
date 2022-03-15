// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "LargestSeriesProduct",
    products: [
        .library(
            name: "LargestSeriesProduct",
            targets: ["LargestSeriesProduct"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LargestSeriesProduct",
            dependencies: []),
        .testTarget(
            name: "LargestSeriesProductTests",
            dependencies: ["LargestSeriesProduct"]),
    ]
)
