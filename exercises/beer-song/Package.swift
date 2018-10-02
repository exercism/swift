// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "BeerSong",
    products: [
        .library(
            name: "BeerSong",
            targets: ["BeerSong"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BeerSong",
            dependencies: []),
        .testTarget(
            name: "BeerSongTests",
            dependencies: ["BeerSong"]),
    ]
)
