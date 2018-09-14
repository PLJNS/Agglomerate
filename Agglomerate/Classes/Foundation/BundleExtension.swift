import Foundation

extension Bundle {
    
    /// Release version number - this is the version number that will likely to be be seen by the public.
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    /// Build version number - this is the version number that is often internally referred.
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    /// Formatted release version number.
    var formattedReleaseVersionNumber: String {
        return "VERSION \(releaseVersionNumber ?? "1.0.0")"
    }
    
}

