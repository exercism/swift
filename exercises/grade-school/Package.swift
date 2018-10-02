// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "GradeSchool",
    products: [
        .library(
            name: "GradeSchool",
            targets: ["GradeSchool"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GradeSchool",
            dependencies: []),
        .testTarget(
            name: "GradeSchoolTests",
            dependencies: ["GradeSchool"]),
    ]
)
