extension String {
    
    /// Initialization using unicode name.
    ///
    /// - Parameter unicodeNameString: Unicode name as string.
    init(unicodeNameString: String) {
        if let unicode = Int(unicodeNameString.replacingOccurrences(of: "U+", with: ""), radix: 16),
            let scalar = UnicodeScalar(unicode) {
            self = String(scalar)
        } else {
            self = ""
        }
    }
    
    /// Returns a string with leading and trailing whitespace trimmed.
    var whitespaceTrimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// New string, capitalizes first letter
    ///
    /// - Returns: A string with the first letter capitalized
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    /// Mutates self to be the capitalized first letter version
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    /// Generates a localized string with the given parameters.
    ///
    /// - Parameter comment: Comment for the localized string.
    /// - Returns: String that is localized.
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
    /// Returns nil if empty, quite useful when "" means the same as nil to you.
    var nilIfEmpty: String? {
        return isEmpty ? nil : self
    }
    
    /// Is this string a valid URL?
    var isValidUrl: Bool {
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector?.matches(in: self, options: [], range: NSRange(location: 0, length: utf16.count))
        if let matchUrl = matches?.first?.url, let url = url {
            return url.absoluteString == matchUrl.absoluteString
        }
        return false
    }
    
    /// Attempt to build a url with this string.
    var url: URL? {
        return URL(string: urlString)
    }
    
    /// Attempt to build a url string with this string, check for http because no one cares about that.
    var urlString: String {
        var urlString = self
        if !(urlString.contains("://")) {
            urlString = "https://\(urlString)"
        }
        return urlString
    }
    
}
