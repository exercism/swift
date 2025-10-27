// swift-tools-version:6.2

import PackageDescription

let package = Package(
    name: "Generator",
    platforms: [
        .macOS(.v13) // macOS 13.0 (Ventura) or later.
    ],
    dependencies: [
        .package(url: "https://github.com/stencilproject/Stencil.git", from: "0.15.1"),
        .package(url: "https://github.com/LebJe/TOMLKit.git", from: "0.6.0"),
        .package(url: "https://github.com/apple/swift-format", from: "602.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.6.1"),
    ],
    targets: [
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
