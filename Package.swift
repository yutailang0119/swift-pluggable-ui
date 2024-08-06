// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-pluggable-ui",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8),
        .macCatalyst(.v15),
    ],
    products: [
        .library(
            name: "SwiftPluggableUI",
            targets: ["SwiftPluggableUI"]),
    ],
    targets: [
        .target(
            name: "SwiftPluggableUI"),
        .testTarget(
            name: "SwiftPluggableUITests",
            dependencies: ["SwiftPluggableUI"]
        ),
    ]
)
