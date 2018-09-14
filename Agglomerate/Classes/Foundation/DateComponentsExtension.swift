import Foundation

// MARK: - Comparable
extension DateComponents: Comparable {
    
    public static func < (lhs: DateComponents, rhs: DateComponents) -> Bool {
        guard let lhsDate = Calendar.current.date(from: lhs), let rhsDate = Calendar.current.date(from: rhs) else {
            fatalError("The date matching given date components cannot be found")
        }

        return lhsDate < rhsDate
    }
    
    static func == (lhs: DateComponents, rhs: DateComponents) -> Bool {
        return lhs.year == rhs.year &&
            lhs.month == rhs.month &&
            lhs.day == rhs.day
    }
    
}
