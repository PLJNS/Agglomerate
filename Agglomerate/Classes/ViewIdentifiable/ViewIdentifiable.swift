
/// Protocol to add a default identifier to every view controller, table view cell, and collection view cell.
public protocol ViewIdentifiable: class {

    /// The view controller identifier.
    static var identifier: String { get }

}

public extension ViewIdentifiable {

    /// The view controller identifier using the class name.
    static var identifier: String {
        return String(describing: self)
    }

}

extension UIViewController: ViewIdentifiable { }
extension UIView: ViewIdentifiable { }
