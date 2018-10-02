// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "RobotSimulator",
    products: [
        .library(
            name: "RobotSimulator",
            targets: ["RobotSimulator"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RobotSimulator",
            dependencies: []),
        .testTarget(
            name: "RobotSimulatorTests",
            dependencies: ["RobotSimulator"]),
    ]
)
