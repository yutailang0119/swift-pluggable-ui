// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
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
      targets: ["SwiftPluggableUI"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "602.0.0")
  ],
  targets: [
    .macro(
      name: "SwiftPluggableUIMacros",
      dependencies: [
        .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
        .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
      ]
    ),
    .target(
      name: "SwiftPluggableUI",
      dependencies: ["SwiftPluggableUIMacros"]
    ),
    .testTarget(
      name: "SwiftPluggableUITests",
      dependencies: [
        "SwiftPluggableUIMacros",
        .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
      ]
    ),
  ],
  swiftLanguageModes: [.v6]
)
