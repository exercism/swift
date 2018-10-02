// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "ComplexNumbers",
    products: [
        .library(
            name: "ComplexNumbers",
            targets: ["ComplexNumbers"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ComplexNumbers",
            dependencies: []),
        .testTarget(
            name: "ComplexNumbersTests",
            dependencies: ["ComplexNumbers"]),
    ]
)
