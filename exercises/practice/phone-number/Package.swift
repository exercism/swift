// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "PhoneNumber",
    products: [
        .library(
            name: "PhoneNumber",
            targets: ["PhoneNumber"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PhoneNumber",
            dependencies: []),
        .testTarget(
            name: "PhoneNumberTests",
            dependencies: ["PhoneNumber"]),
    ]
)
