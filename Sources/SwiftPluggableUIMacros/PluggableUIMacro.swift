import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct PluggableUIMacro: ExtensionMacro {
  public static func expansion(
    of node: SwiftSyntax.AttributeSyntax,
    attachedTo declaration: some SwiftSyntax.DeclGroupSyntax,
    providingExtensionsOf type: some SwiftSyntax.TypeSyntaxProtocol,
    conformingTo protocols: [SwiftSyntax.TypeSyntax],
    in context: some SwiftSyntaxMacros.MacroExpansionContext
  ) throws -> [SwiftSyntax.ExtensionDeclSyntax] {
    guard let typeName = type.as(IdentifierTypeSyntax.self)?.name,
      !typeName.text.isEmpty
    else {
      let error = MacroExpansionErrorMessage("Type name invalid")
      context.diagnose(
        Diagnostic(
          node: node,
          message: error
        )
      )
      throw error
    }

    let syntax = ExtensionDeclSyntax(
      extendedType: TypeSyntax(stringLiteral: "\(typeName)"),
      inheritanceClause: protocols.isEmpty
        ? nil
        : InheritanceClauseSyntax {
          protocols.map {
            InheritedTypeSyntax(type: $0)
          }
        },
      memberBlock: MemberBlockSyntax {
        VariableDeclSyntax(
          modifiers: [DeclModifierSyntax(name: .keyword(.public))],
          bindingSpecifier: .keyword(.var),
          bindings: PatternBindingListSyntax {
            PatternBindingSyntax(
              pattern: PatternSyntax(
                IdentifierPatternSyntax(
                  identifier: TokenSyntax(stringLiteral: "body")
                )
              ),
              typeAnnotation: TypeAnnotationSyntax(
                type: SomeOrAnyTypeSyntax(
                  someOrAnySpecifier: .keyword(.some),
                  constraint: TypeSyntax(stringLiteral: "View")
                )
              ),
              accessorBlock: AccessorBlockSyntax(
                accessors: .getter(
                  CodeBlockItemListSyntax {
                    CodeBlockItemSyntax(
                      item: .expr(
                        ExprSyntax(
                          IfExprSyntax(
                            conditions: ConditionElementListSyntax {
                              OptionalBindingConditionSyntax(
                                bindingSpecifier: .keyword(.let),
                                pattern: PatternSyntax(
                                  IdentifierPatternSyntax(
                                    identifier: TokenSyntax(stringLiteral: "plugin")
                                  )
                                ),
                                initializer: InitializerClauseSyntax(
                                  value: AsExprSyntax(
                                    expression: DeclReferenceExprSyntax(
                                      baseName: TokenSyntax(stringLiteral: "self")
                                    ),
                                    questionOrExclamationMark: .postfixQuestionMarkToken(),
                                    type: SomeOrAnyTypeSyntax(
                                      someOrAnySpecifier: .keyword(.any),
                                      constraint: TypeSyntax(stringLiteral: "PluginUI")
                                    )
                                  )
                                )
                              )
                            },
                            body: CodeBlockSyntax(
                              statements: CodeBlockItemListSyntax {
                                CodeBlockItemSyntax(
                                  item: .expr(
                                    ExprSyntax(
                                      FunctionCallExprSyntax(
                                        calledExpression: DeclReferenceExprSyntax(
                                          baseName: TokenSyntax(stringLiteral: "AnyView")
                                        ),
                                        leftParen: .leftParenToken(),
                                        arguments: LabeledExprListSyntax {
                                          LabeledExprSyntax(
                                            expression: MemberAccessExprSyntax(
                                              base: DeclReferenceExprSyntax(
                                                baseName: TokenSyntax(stringLiteral: "plugin")
                                              ),
                                              declName: DeclReferenceExprSyntax(
                                                baseName: TokenSyntax(stringLiteral: "pluginBody")
                                              )
                                            )
                                          )
                                        },
                                        rightParen: .rightParenToken()
                                      )
                                    )
                                  )
                                )
                              }
                            ),
                            elseKeyword: .keyword(.else),
                            elseBody: .codeBlock(
                              CodeBlockSyntax(
                                statements: CodeBlockItemListSyntax {
                                  CodeBlockItemSyntax(
                                    item: .expr(
                                      ExprSyntax(
                                        DeclReferenceExprSyntax(
                                          baseName: TokenSyntax(stringLiteral: "defaultBody")
                                        )
                                      )
                                    )
                                  )
                                }
                              )
                            )
                          )
                        )
                      )
                    )
                  }
                )
              )
            )
          }
        )
      }
    )

    return [
      syntax
    ]
  }
}
