import SwiftSyntaxMacros
import XCTest

#if canImport(SwiftPluggableUIMacros)
import SwiftPluggableUIMacros

let testMacros: [String: Macro.Type] = [
  "PluggableUI": PluggableUIMacro.self
]
#endif

final class SwiftPluggableUITests: XCTestCase {
  func testExample() throws {}
}
