// swift-tools-version:5.3

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
