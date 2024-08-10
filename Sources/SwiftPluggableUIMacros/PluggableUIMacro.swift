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

        fatalError()
    }
}
