import Declaration
import SwiftPluggableUI
import SwiftUI

extension PluggableText: @retroactive PluginUI {
  public var pluginBody: some View {
    Text(text)
      .font(.largeTitle)
      .foregroundStyle(.blue)
  }
}

#Preview {
  PluggableText(text: "Text")
}
