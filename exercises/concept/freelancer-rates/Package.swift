// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FreelancerRates",
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "FreelancerRates",
      targets: ["FreelancerRates"])
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(url: "https://github.com/apple/swift-numerics", from: "1.0.3"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "FreelancerRates",
      dependencies: []),
    .testTarget(
      name: "FreelancerRatesTests",
      dependencies: ["FreelancerRates", .product(name: "RealModule", package: "swift-numerics"),]),
  ]
)
