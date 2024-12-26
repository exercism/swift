// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "ComplexNumbers",
    products: [
        .library(
            name: "ComplexNumbers",
            targets: ["ComplexNumbers"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-numerics", from: "1.0.2"),
    ],
    targets: [
        .target(
            name: "ComplexNumbers",
            dependencies: [
                .product(name: "Numerics", package: "swift-numerics"),
            ]),
        .testTarget(
            name: "ComplexNumbersTests",
            dependencies: ["ComplexNumbers",
            .product(name: "Numerics", package: "swift-numerics"),]),
    ]
)
