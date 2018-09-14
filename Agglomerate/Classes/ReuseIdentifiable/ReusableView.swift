/// Defines a reusable collection or table view cell.
protocol ReusableView: class {
    
    /// Default reuse identifier is set with the class name.
    static var reuseIdentifier: String { get }
    
}

extension ReusableView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
