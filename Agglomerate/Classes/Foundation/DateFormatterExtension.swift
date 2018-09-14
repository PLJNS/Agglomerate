import Foundation

extension DateFormatter {

    /// Single Instance of DateFormatter for the App.
    private static let sharedInstance = DateFormatter()

    private static let customFormatter = DateFormatter()
    
    /// Uses a static formatter to build you a string from a format, don't use it though,
    /// go to Date Extensions and use that instead.
    ///
    /// - Parameters:
    ///   - date: The date you want the string of
    ///   - dateFormat: The format you want it in.
    /// - Returns: The string.
    static func string(of date: Date, using dateFormat: DateFormat) -> String? {
        DateFormatter.customFormatter.dateFormat = dateFormat.rawValue
        return DateFormatter.customFormatter.string(from: date)
    }
    
}
