import SwiftUI

public protocol PluginUI {
    associatedtype PluginBody: View
    var pluginBody: Self.PluginBody { get }
}
