import Foundation

extension TimeInterval {

    /// Determines if the TimeInterval has passed from the given date.
    ///
    /// - Parameter date: Optional date to check.
    /// - Returns: Flag if the TimerInterval has passed from the given date.
    func hasElapsed(since date: Date?) -> Bool {
        if let date = date {
            return Date() > date + self
        }
        return false
    }

}
