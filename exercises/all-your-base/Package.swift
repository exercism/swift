// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "AllYourBase",
    products: [
        .library(
            name: "AllYourBase",
            targets: ["AllYourBase"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AllYourBase",
            dependencies: []),
        .testTarget(
            name: "AllYourBaseTests",
            dependencies: ["AllYourBase"]),
    ]
)
