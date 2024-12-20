// swift-tools-version:6.0

import PackageDescription

let package = Package(
  name: "Meetup",
  products: [
    .library(
      name: "Meetup",
      targets: ["Meetup"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Meetup",
      dependencies: []),
    .testTarget(
      name: "MeetupTests",
      dependencies: ["Meetup"]),
  ]
)
