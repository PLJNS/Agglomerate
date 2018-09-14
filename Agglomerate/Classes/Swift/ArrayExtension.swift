extension Array {

    /// Removes item safely.
    ///
    /// - Parameter index: Index of the item to remove.
    mutating func removeSafely(at index: Int) {
        if index < count {
            remove(at: index)
        }
    }

}

extension Array where Element == Int {
    
    /// Returns the sum of elements in the array.
    ///
    /// - Returns: Sum of elements in array.
    func sum() -> Int {
        return reduce(0, +)
    }
    
}

// MARK: - Hashable
extension Array where Element: Hashable {
    
    /// Convinience for converting this array into a set.
    var set: Set<Element> {
        return Set<Element>(self)
    }
    
}

extension Array where Element == Bool {
    
    /// Returns true if all elements are true, false otherwise.
    ///
    /// - Parameter set: Whether all should be set to true or false.
    /// - Returns: True if all elements are true, false otherwise.
    func all(_ set: Bool) -> Bool {
        return !contains(!set)
    }
    
}
