import Foundation

extension URLRequest {
    
    /// Returns a cURL command for a request
    ///
    /// - return A String object that contains cURL command or "" if an URL is not properly initalized.
    public var cURL: String {
        guard let url = url, let httpMethod = httpMethod, url.absoluteString.utf8.count > 0 else {
            return ""
        }
        
        var curlCommand = "\ncurl "
        
        // URL
        curlCommand = curlCommand.appendingFormat(" '%@' ", url.absoluteString)
        
        // Method if different from GET
        if "GET" != httpMethod {
            curlCommand = curlCommand.appendingFormat(" -X %@ ", httpMethod)
        }
        
        // Headers
        let allHeadersFields = allHTTPHeaderFields!
        let allHeadersKeys = Array(allHeadersFields.keys)
        let sortedHeadersKeys  = allHeadersKeys.sorted(by: <)
        for key in sortedHeadersKeys {
            curlCommand = curlCommand.appendingFormat(" -H '%@: %@' ", key, self.value(forHTTPHeaderField: key)!)
        }
        
        // HTTP body
        if let httpBody = httpBody, httpBody.count > 0 {
            let httpBodyString = String(data: httpBody, encoding: String.Encoding.utf8)!
            let escapedHttpBody = URLRequest.escapeAllSingleQuotes(httpBodyString)
            curlCommand = curlCommand.appendingFormat(" --data '%@'", escapedHttpBody)
        }
        
        return curlCommand.appending("\n")
    }
    
    /// Escapes all single quotes for shell from a given string.
    static func escapeAllSingleQuotes(_ value: String) -> String {
        return value.replacingOccurrences(of: "'", with: "'\\''")
    }
    
}
