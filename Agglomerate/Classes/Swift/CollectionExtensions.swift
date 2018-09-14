extension Collection {
    
    /// Returns an optional if the index is out of bounds.
    ///
    /// - Parameter index: What index of an item do you want to get?
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}

extension Collection where Element == String {
    
    /// Gives you a human readable comma separated list
    var commaSeparated: String {
        return joined(separator: ", ")
    }
    
}
