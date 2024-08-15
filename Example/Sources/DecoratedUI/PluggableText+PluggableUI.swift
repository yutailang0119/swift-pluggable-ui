import Declaration
import SwiftPluggableUI
import SwiftUI

extension PluggableText: @retroactive PluginUI {
  public var pluginBody: some View {
    Text(text)
      .font(.largeTitle)
      .foregroundStyle(.red)
  }
}

#Preview {
  PluggableText(text: "Text")
}
