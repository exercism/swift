// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "TwoFer",
    products: [
        .library(
            name: "TwoFer",
            targets: ["TwoFer"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TwoFer",
            dependencies: []),
        .testTarget(
            name: "TwoFerTests",
            dependencies: ["TwoFer"]),
    ]
)
