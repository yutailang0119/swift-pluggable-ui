import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxMacros

public struct PluggableUIMacro: ExtensionMacro {
  public static func expansion(
    of node: SwiftSyntax.AttributeSyntax,
    attachedTo declaration: some SwiftSyntax.DeclGroupSyntax,
    providingExtensionsOf type: some SwiftSyntax.TypeSyntaxProtocol,
    conformingTo protocols: [SwiftSyntax.TypeSyntax],
    in context: some SwiftSyntaxMacros.MacroExpansionContext
  ) throws -> [SwiftSyntax.ExtensionDeclSyntax] {
    guard
      let typeName = type.as(IdentifierTypeSyntax.self)?.name,
      !typeName.text.isEmpty
    else {
      let error = MacroExpansionErrorMessage("type name invalid")
      context.diagnose(
        Diagnostic(
          node: node,
          message: error
        )
      )
      throw error
    }

    return [
      try ExtensionDeclSyntax(
        """
        extension \(raw: typeName): \(raw: protocols.map(\.description).joined(separator: ", ")){
          public var body: some View {
            if let plugin = self as? any PluginUI {
              AnyView(plugin.pluginBody)
            } else {
              defaultBody
            }
          }
        }
        """
      )
      .formatted()
      .cast(ExtensionDeclSyntax.self),
    ]
  }
}
