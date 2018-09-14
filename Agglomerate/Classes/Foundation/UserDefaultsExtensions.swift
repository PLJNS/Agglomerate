import Foundation

enum UserDefaultsKeys: String {
    case completedOnboarding = "COMPLETED_ONBOARDING"
    
}

extension UserDefaults {
    
    /// This is a temporary solution while backend works out how they want to support this feature.
    var completedOnboarding: Bool {
        get {
            return bool(forKey: UserDefaultsKeys.completedOnboarding.rawValue)
        } set {
            set(newValue, forKey: UserDefaultsKeys.completedOnboarding.rawValue)
        }
    }
    
}
