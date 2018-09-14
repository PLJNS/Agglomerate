extension Bool {
    
    /// If this boolean is true, it will return you what you pass in, else nil.
    ///
    /// - Parameter any: Anything
    /// - Returns: Non-nil thing if true, nil if false
    func nilIfFalse<T>(_ any: T) -> T? {
        return self ? any : nil
    }
    
}
