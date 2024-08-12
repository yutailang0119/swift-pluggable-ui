// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Example",
  platforms: [
    .macOS(.v12),
    .iOS(.v15),
    .tvOS(.v15),
    .watchOS(.v8),
    .macCatalyst(.v15),
  ],
  dependencies: [
    .package(path: "../../swift-pluggable-ui")
  ],
  targets: [
    .target(
      name: "PluggableUIDeclaration",
      dependencies: [
        .product(name: "SwiftPluggableUI", package: "swift-pluggable-ui")
      ]
    ),
    .target(
      name: "CustomUIApp",
      dependencies: [
        .target(name: "PluggableUIDeclaration"),
        .product(name: "SwiftPluggableUI", package: "swift-pluggable-ui"),
      ]
    ),
    .target(
      name: "PlainUIApp",
      dependencies: [
        .target(name: "PluggableUIDeclaration"),
        .product(name: "SwiftPluggableUI", package: "swift-pluggable-ui"),
      ]
    ),
  ]
)
