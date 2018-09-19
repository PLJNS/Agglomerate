import Foundation

extension Date {
    
    /// Gets you the string from date format
    ///
    /// - Parameter format: See DateFormat enum
    /// - Returns: A string if possible
    func string(format: String) -> String? {
        return DateFormatter.string(of: self, using: format)
    }
}
