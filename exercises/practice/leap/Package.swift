// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Leap",
    products: [
        .library(
            name: "Leap",
            targets: ["Leap"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Leap",
            dependencies: []),
        .testTarget(
            name: "LeapTests",
            dependencies: ["Leap"]),
    ]
)
