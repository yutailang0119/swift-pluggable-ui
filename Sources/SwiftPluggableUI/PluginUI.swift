import SwiftUI

@MainActor public protocol PluginUI {
  associatedtype PluginBody: View
  @ViewBuilder var pluginBody: Self.PluginBody { get }
}
