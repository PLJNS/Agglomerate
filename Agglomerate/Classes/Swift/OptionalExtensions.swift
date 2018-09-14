extension Optional where Wrapped == String {
    
    /// If this string is nil or empty, this returns false.
    var isEmptyOrNil: Bool {
        return self?.nilIfEmpty != nil
    }
    
    /// Is self nil? If so, get the empty string, otherwise get self.
    var emptyStringIfNil: String {
        return self ?? ""
    }
    
}

// MARK: - Collection
extension Optional where Wrapped: Collection {
    
    /// Gets the count or gives you zero if nil.
    var countOrZeroIfNil: Int {
        switch self {
        case .none:
            return 0
        case .some(let concreteSelf):
            return concreteSelf.count
        }
    }
    
}
