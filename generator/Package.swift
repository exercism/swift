// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Generator",
    platforms: [
        .macOS(.v13) // Set the minimum supported macOS version to 13.0 (Ventura) or later.
    ],
    dependencies: [
        .package(url: "https://github.com/stencilproject/Stencil.git", from: "0.15.1"),
        .package(url: "https://github.com/LebJe/TOMLKit.git", from: "0.6.0"),
        .package(url: "https://github.com/apple/swift-format", from: "602.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.6.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .executableTarget(
            name: "Generator",
            dependencies: [
                .product(name: "Stencil", package: "Stencil"),
                .product(name: "TOMLKit", package: "TOMLKit"),
                .product(name: "SwiftFormat", package: "swift-format"),
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .testTarget(
            name: "GeneratorTests",
            dependencies: ["Generator"],
            resources: [
                .copy("Resources")
            ]
        ),
    ]
)
