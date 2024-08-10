import SwiftUI

@attached(
    extension,
    conformances: SwiftUI.View,
    names: named(body)
)
public macro PluggableUI() = #externalMacro(module: "SwiftPluggableUIMacros", type: "PluggableUIMacro")
