// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-pluggable-ui",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "swift-pluggable-ui",
            targets: ["swift-pluggable-ui"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "swift-pluggable-ui"),
        .testTarget(
            name: "swift-pluggable-uiTests",
            dependencies: ["swift-pluggable-ui"]
        ),
    ]
)
