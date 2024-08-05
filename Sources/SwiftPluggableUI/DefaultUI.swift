import SwiftUI

public protocol DefaultUI {
    associatedtype DefaultBody: View
    var defaultBody: Self.DefaultBody { get }
}
