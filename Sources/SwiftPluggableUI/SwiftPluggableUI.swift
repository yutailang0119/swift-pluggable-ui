import SwiftUI

@attached(
  extension,
  conformances: SwiftUI.View,
  SwiftPluggableUI.DefaultUI,
  names: named(body)
)
public macro PluggableUI() =
  #externalMacro(module: "SwiftPluggableUIMacros", type: "PluggableUIMacro")
