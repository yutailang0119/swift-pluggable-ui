import SwiftUI

public protocol PluggableUI {
    associatedtype PluggableBody: View
    var pluggableBody: Self.PluggableBody { get }
}
