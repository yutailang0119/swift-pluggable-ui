import SwiftPluggableUI
import SwiftUI

@PluggableUI
public struct PluggableText {
  public var text: String

  public init(text: String) {
    self.text = text
  }
}

extension PluggableText: DefaultUI {
  public var defaultBody: some View {
    Text(text)
      .foregroundStyle(.blue)
  }
}

#Preview {
  PluggableText(text: "Text")
}
