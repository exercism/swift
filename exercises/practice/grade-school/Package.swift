// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "GradeSchool",
  products: [
    .library(
      name: "GradeSchool",
      targets: ["GradeSchool"])
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
