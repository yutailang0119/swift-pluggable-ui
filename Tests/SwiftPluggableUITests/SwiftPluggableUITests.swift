import SwiftSyntaxMacroExpansion
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

#if canImport(SwiftPluggableUIMacros)
import SwiftPluggableUIMacros

let testMacros: [String: MacroSpec] = [
  "PluggableUI": MacroSpec(
    type: PluggableUIMacro.self,
    conformances: ["View", "DefaultUI"]
  )
]
#endif

final class SwiftPluggableUITests: XCTestCase {
  func testPluggableUIMacro() throws {
    #if canImport(SwiftPluggableUIMacros)
    assertMacroExpansion(
      """
      @PluggableUI
      public struct PluggableView {}
      """,
      expandedSource: """
        public struct PluggableView {}

        extension PluggableView: View, DefaultUI {
          public var body: some View {
            if let plugin = self as? any PluginUI {
              AnyView(plugin.pluginBody)
            } else {
              defaultBody
            }
          }
        }
        """,
      macroSpecs: testMacros
    )
    #else
    throw XCTSkip("macros are only supported when running tests for the host platform")
    #endif
  }
}
