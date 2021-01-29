// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "PalindromeProducts",
    products: [
        .library(
            name: "PalindromeProducts",
            targets: ["PalindromeProducts"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PalindromeProducts",
            dependencies: []),
        .testTarget(
            name: "PalindromeProductsTests",
            dependencies: ["PalindromeProducts"]),
    ]
)
