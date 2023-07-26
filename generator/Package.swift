// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Generator",
  dependencies: [
    .package(url: "https://github.com/stencilproject/Stencil.git", from: "0.15.1"),
    .package(url: "https://github.com/LebJe/TOMLKit.git", from: "0.5.5"),
    .package(url: "https://github.com/apple/swift-format", from: "508.0.1"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
      name: "Generator",
      dependencies: [
        .product(name: "Stencil", package: "Stencil"),
        .product(name: "TOMLKit", package: "TOMLKit"),
        .product(name: "SwiftFormat", package: "swift-format"),
      ]),
    .testTarget(
      name: "GeneratorTests",
      dependencies: ["Generator"]),
  ]
)
