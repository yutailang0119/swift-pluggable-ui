import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct PluggableUIPlugin: CompilerPlugin {
  let providingMacros: [Macro.Type] = [
    PluggableUIMacro.self,
  ]
}
