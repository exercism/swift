// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Anagram",
    products: [
        .library(
            name: "Anagram",
            targets: ["Anagram"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Anagram",
            dependencies: []),
        .testTarget(
            name: "AnagramTests",
            dependencies: ["Anagram"]),
    ]
)
