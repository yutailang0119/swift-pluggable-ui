# SwiftPluggableUI

## Installation

### [Swift Package Manager](https://swift.org/package-manager/)

```swift
// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

let package = Package(
  name: "Example",
  platforms: [
    .macOS(.v12), .iOS(.v15), .tvOS(.v15), .watchOS(.v8), .macCatalyst(.v15),
  ],
  targets: [
    .target(
      name: "DeclarationUI",
      dependencies: [
        .product(name: "SwiftPluggableUI", package: "swift-pluggable-ui")
      ]
    ),
    .target(
      name: "DecoratedUI",
      dependencies: [
        .target(name: "DeclarationUI"),
        .product(name: "SwiftPluggableUI", package: "swift-pluggable-ui"),
      ]
    ),
  ]
)
```
