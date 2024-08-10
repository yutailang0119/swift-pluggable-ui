import SwiftUI

@MainActor public protocol DefaultUI {
  associatedtype DefaultBody: View
  @ViewBuilder var defaultBody: Self.DefaultBody { get }
}
