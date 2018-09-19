extension UITableView {
    
    /// Get an index set with all the sections in this table view.
    var allSectionsIndexSet: IndexSet {
        return IndexSet(integersIn: 0..<numberOfSections)
    }
    
    /// Reload the table view with an animation
    ///
    /// WARNING: Do not call this if the number of sections has changed since you last
    /// called `reloadData`.
    ///
    /// - Parameter animation: the animation you want.
    func reloadAllSections(with animation: UITableViewRowAnimation = .automatic) {
        reloadSections(allSectionsIndexSet, with: animation)
    }
    
    public var indexPathsCount: Int {
        var count = 0
        for section in 0..<numberOfSections {
            for _ in 0..<numberOfRows(inSection: section) {
                count += 1
            }
        }
        return count
    }
    
    @discardableResult public func selectAllRows(_ selected: Bool, _ animated: Bool) -> Bool {
        var editedRow = false
        for section in 0..<numberOfSections {
            for row in 0..<numberOfRows(inSection: section) {
                if selected {
                    selectRow(at: IndexPath(row: row, section: section), animated: animated, scrollPosition: .none)
                    editedRow = true
                } else {
                    deselectRow(at: IndexPath(row: row, section: section), animated: animated)
                    editedRow = true
                }
            }
        }
        return editedRow
    }
}

extension UITableView {
    
    /// SwifterSwift: Dequeue reusable UITableViewCell using class name
    ///
    /// - Parameter name: UITableViewCell type
    /// - Returns: UITableViewCell object with associated class name.
    public func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: name)) as? T else {
            fatalError("Couldn't find UITableViewCell for \(String(describing: name))")
        }
        return cell
    }
    
    /// SwiferSwift: Dequeue reusable UITableViewCell using class name for indexPath
    ///
    /// - Parameters:
    ///   - name: UITableViewCell type.
    ///   - indexPath: location of cell in tableView.
    /// - Returns: UITableViewCell object with associated class name.
    public func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError("Couldn't find UITableViewCell for \(String(describing: name))")
        }
        return cell
    }
    
    /// SwiferSwift: Dequeue reusable UITableViewHeaderFooterView using class name
    ///
    /// - Parameter name: UITableViewHeaderFooterView type
    /// - Returns: UITableViewHeaderFooterView object with associated class name.
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass name: T.Type) -> T {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: String(describing: name)) as? T else {
            fatalError("Couldn't find UITableViewHeaderFooterView for \(String(describing: name))")
        }
        return headerFooterView
    }
    
    /// SwifterSwift: Register UITableViewHeaderFooterView using class name
    ///
    /// - Parameters:
    ///   - nib: Nib file used to create the header or footer view.
    ///   - name: UITableViewHeaderFooterView type.
    public func register<T: UITableViewHeaderFooterView>(nib: UINib?, withHeaderFooterViewClass name: T.Type) {
        register(nib, forHeaderFooterViewReuseIdentifier: String(describing: name))
    }
    
    /// SwifterSwift: Register UITableViewHeaderFooterView using class name
    ///
    /// - Parameter name: UITableViewHeaderFooterView type
    public func register<T: UITableViewHeaderFooterView>(headerFooterViewClassWith name: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: String(describing: name))
    }
    
    /// SwifterSwift: Register UITableViewCell using class name
    ///
    /// - Parameter name: UITableViewCell type
    public func register<T: UITableViewCell>(cellWithClass name: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: name))
    }
    
    /// SwifterSwift: Register UITableViewCell using class name
    ///
    /// - Parameters:
    ///   - nib: Nib file used to create the tableView cell.
    ///   - name: UITableViewCell type.
    public func register<T: UITableViewCell>(nib: UINib?, withCellClass name: T.Type) {
        register(nib, forCellReuseIdentifier: String(describing: name))
    }
    
    /// SwifterSwift: Register UITableViewCell with .xib file using only its corresponding class.
    ///               Assumes that the .xib filename and cell class has the same name.
    ///
    /// - Parameters:
    ///   - name: UITableViewCell type.
    ///   - bundleClass: Class in which the Bundle instance will be based on.
    public func register<T: UITableViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) {
        let identifier = String(describing: name)
        var bundle: Bundle?
        
        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }
        
        register(UINib(nibName: identifier, bundle: bundle), forCellReuseIdentifier: identifier)
    }
    
}
