import SwiftSyntaxMacros
import Testing

#if canImport(SwiftPluggableUIMacros)
import SwiftPluggableUIMacros

let testMacros: [String: Macro.Type] = [
  "PluggableUI": PluggableUIMacro.self
]
#endif

@Suite
struct SwiftPluggableUITests {
  @Test
  func example() throws {}
}
