extension Dictionary {
    
    /// Maps your transform onto the keys and values of this dictionary, returning the new type.
    ///
    /// - Parameter transform: The transform you want to perform
    /// - Returns: The dictionary after transform
    func map<T: Hashable, U>(transform: (Key, Value) -> (T, U)) -> [T: U] {
        var result: [T: U] = [:]
        for (key, value) in self {
            let (transformedKey, transformedValue) = transform(key, value)
            result[transformedKey] = transformedValue
        }
        return result
    }
    
}

// MARK: - OptionalType
extension Dictionary where Value: OptionalType {
    
    /// Filters nil values.
    var filteringNilValues: [Key: Value.Wrapped] {
        var result: [Key: Value.Wrapped] = [:]
        for (key, value) in self {
            if let unwrappedValue = value.asOptional {
                result[key] = unwrappedValue
            }
        }
        return result
    }

}


// MARK: - [String]]
extension Dictionary where Dictionary == [String: [String]] {
    
    /// Returns an array of query items representing array queries.
    ///
    /// - Returns: Array of URL query items.
    func queryArrayItems() -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        forEach {
            if !$0.value.isEmpty {
                let key = $0.key
                return $0.value.forEach { queryItems.append(URLQueryItem(name: "\(key)[]", value: $0)) }
            }
        }
        return queryItems
    }
    
}
