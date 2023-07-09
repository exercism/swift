// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PythagoreanTriplet",
    products: [
        .library(
            name: "PythagoreanTriplet",
            targets: ["PythagoreanTriplet"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PythagoreanTriplet",
            dependencies: []),
        .testTarget(
            name: "PythagoreanTripletTests",
            dependencies: ["PythagoreanTriplet"]),
    ]
)
