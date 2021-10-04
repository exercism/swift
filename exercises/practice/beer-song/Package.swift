// swift-tools-version:5.3

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
